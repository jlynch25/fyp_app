import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/components/friend_details.dart';
import 'package:mylib_example/components/send_args.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
import 'package:mylib_example/screens/send.dart/send_screen.dart';
import 'package:mylib_example/service/chat_service.dart';

TextEditingController titleController = new TextEditingController();

class FriendCardSend extends StatefulWidget {
  final String image;
  final User friend;
  final ChatService service;

  FriendCardSend(
      {required this.image, required this.friend, required this.service});
  @override
  _FriendCardSendState createState() =>
      _FriendCardSendState(this.image, this.friend, this.service);
}

class _FriendCardSendState extends State<FriendCardSend> {
  final String image;
  final User friend;
  final ChatService service;
  String updateResult = "false";

  _FriendCardSendState(this.image, this.friend, this.service);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: InkWell(
        child: Container(
          height: 120,
          width: 90,
          decoration: BoxDecoration(
              color: Color(0xfff1f3f6),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 1),
                    blurRadius: 3,
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
          if (friend.wallets.isNotEmpty) {
            Navigator.pushNamed(context, SendScreen.routeName,
                arguments: SendArguments(friend, friend.wallets[0].address));
          } else {
            final snackBar = SnackBar(
              content: Text("${friend.name} does not have a wallet set up yet"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }
}
