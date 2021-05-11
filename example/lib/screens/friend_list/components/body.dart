import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib_example/components/send_args.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/screens/send.dart/send_screen.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';

class Body extends StatefulWidget {
  final ChatService service;
  Body(this.service);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Set<User> users;
  String updateResult = "false";

  @override
  void initState() {
    super.initState();
    users = Set();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Flexible(
          child: StreamBuilder<User>(
              stream: widget.service.listFriends(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                users.add(snapshot.data!);

                return ListView(
                  children: users
                      .map((friend) => ListTile(
                            leading: Text(friend.name.substring(0, 1)),
                            focusColor: Colors.yellow,
                            title: Text(friend.name),
                            subtitle: Text(friend.phoneNumber),
                            onTap: () {
                              _buildFriendDetails(context, friend);
                              // showDialog(
                              //     context: context,
                              //     barrierDismissible: true,
                              //     builder: (_) => AlertDialog(
                              //             title: Text(friend.name),
                              //             // content: Text(friend.walletAddress),
                              //             backgroundColor: Colors.teal,
                              //             actions: <Widget>[
                              //               TextButton(
                              //                 child: Text('Send Money'),
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop();
                              //                   Navigator.of(context).pop();
                              //                 },
                              //               ),
                              //               TextButton(
                              //                 child: Text('Close'),
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop();
                              //                 },
                              //               ),
                              //             ]));
                            },
                          ))
                      .toList(),
                );
              }))
    ]));
  }

  void _buildFriendDetails(BuildContext context, User user) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
              // title:
              backgroundColor: Colors.grey[100],
              content: SizedBox(
                width: getProportionateScreenHeight(150),
                height: getProportionateScreenHeight(115),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 15,
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
                              border:
                                  Border.all(color: Colors.white70, width: 2)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          user.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
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
                              if (user.wallets.isNotEmpty) {
                                Clipboard.setData(new ClipboardData(
                                        text: user.wallets[0].address))
                                    .then((result) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "Copied ${user.name}'s Address to Clipboard"),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                });
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(
                                      "${user.name} does not have a wallet set up yet"),
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
                                              "Are you sure want to remove ${user.name} as a friend?"),
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
                                                print(user.id);
                                                try {
                                                  await widget.service
                                                      .removeFriends([
                                                    user.id
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
                                                    FriendListScreen.routeName);
                                              },
                                            ),
                                          ]));
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            // Respond to button press
                            if (user.wallets.isNotEmpty) {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, SendScreen.routeName,
                                  arguments: SendArguments(
                                      user, user.wallets[0].address));
                            } else {
                              final snackBar = SnackBar(
                                content: Text(
                                    "${user.name} does not have a wallet set up yet"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          icon: Icon(Icons.send, size: 18),
                          label: Text("Send"),
                        ),
                        SizedBox(width: 10),
                        OutlinedButton.icon(
                          onPressed: () {
                            // Respond to button press
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close, size: 18),
                          label: Text("Close"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // actions: <Widget>[
              //   TextButton(
              //     child: Text('Send Money'),
              //     onPressed: () {
              //       if (friend.wallets.isNotEmpty) {
              //         Navigator.of(context).pop();
              //         Navigator.pushNamed(context, SendScreen.routeName,
              //             arguments: SendArguments(
              //                 friend, friend.wallets[0].address));
              //       } else {
              //         final snackBar = SnackBar(
              //           content: Text(
              //               "${friend.name} does not have a wallet set up yet"),
              //         );
              //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //       }
              //     },
              //   ),
              //   TextButton(
              //     child: Text('Close'),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // ]
            ));
  }
}
