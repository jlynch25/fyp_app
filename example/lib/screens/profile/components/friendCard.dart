import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/components/friend_details.dart';
import 'package:mylib_example/components/send_args.dart';
import 'package:mylib_example/constants.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
import 'package:mylib_example/screens/send.dart/send_screen.dart';
import 'package:mylib_example/service/chat_service.dart';

TextEditingController titleController = new TextEditingController();

class FriendCard extends StatefulWidget {
  final String image;
  final User friend;
  final ChatService service;

  FriendCard(
      {required this.image, required this.friend, required this.service});
  @override
  _FriendCardState createState() =>
      _FriendCardState(this.image, this.friend, this.service);
}

class _FriendCardState extends State<FriendCard> {
  final String image;
  final User friend;
  final ChatService service;
  String updateResult = "false";

  _FriendCardState(this.image, this.friend, this.service);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: InkWell(
        child: Container(
          height: 120,
          width: 90,
          decoration: BoxDecoration(
              color: kPrimaryLightColor, //Color(0xfff1f3f6),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 1),
                    blurRadius: 7,
                    spreadRadius: 2)
              ]),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // image: DecorationImage(
                    //     image: AssetImage('asset/images/$image.png'),
                    //     fit: BoxFit.contain),
                    border: Border.all(color: Colors.white70, width: 2)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${friend.name}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        onTap: () {
          _buildFriendDetails(context, friend);
        },
      ),
    );
  }

  void _buildFriendDetails(BuildContext context, User friend) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(friend.name),
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        const PopupMenuItem(
                          child: ListTile(
                            leading: Icon(Icons.content_copy),
                            title: Text('Copy Address'),
                          ),
                          value: 1,
                        ),
                        const PopupMenuDivider(),
                        const PopupMenuItem(
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Remove Friend'),
                          ),
                          value: 2,
                        ),
                      ],
                      onSelected: (result) {
                        if (result == 1) {
                          if (friend.wallets.isNotEmpty) {
                            Clipboard.setData(new ClipboardData(
                                    text: friend.wallets[0].address))
                                .then((result) {
                              final snackBar = SnackBar(
                                content: Text(
                                    "Copied ${widget.friend.name}'s Address to Clipboard"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          } else {
                            final snackBar = SnackBar(
                              content: Text(
                                  "${friend.name} does not have a wallet set up yet"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else if (result == 2) {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) => AlertDialog(
                                      title: Text(
                                          "Are you sure want to remove ${friend.name} as a friend?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('no'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('yes'),
                                          onPressed: () async {
                                            print(" friend.id");
                                            print(friend.id);
                                            try {
                                              await this.service.removeFriends([
                                                friend.id
                                              ]).then((val) => setState(() {
                                                    updateResult = val!;
                                                  }));
                                            } on GrpcError catch (err) {
                                              final snackBar = SnackBar(
                                                content: Text(err.message!),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                            if (updateResult == "true") {
                                              final snackBar = SnackBar(
                                                content: Text(
                                                    "Successfully removed"),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: Text(updateResult),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                            Navigator.pushNamed(context,
                                                ProfileScreen.routeName);
                                          },
                                        ),
                                      ]));
                        }
                      },
                    ),
                  ],
                ),
                backgroundColor: Colors.cyanAccent,
                actions: <Widget>[
                  TextButton(
                    child: Text('Send Money'),
                    onPressed: () {
                      if (friend.wallets.isNotEmpty) {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, SendScreen.routeName,
                            arguments: SendArguments(
                                friend, friend.wallets[0].address));
                      } else {
                        final snackBar = SnackBar(
                          content: Text(
                              "${friend.name} does not have a wallet set up yet"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]));
  }
}
