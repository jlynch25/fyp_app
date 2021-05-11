import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/constants.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/service/chat_service.dart';

TextEditingController titleController = new TextEditingController();

class MoreFriends extends StatefulWidget {
  final ChatService service;
  MoreFriends(this.service);
  @override
  _MoreFriendsState createState() => _MoreFriendsState();
}

class _MoreFriendsState extends State<MoreFriends> {
  User user = ChatService.user;
  String updateResult = "false";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: InkWell(
        child: Container(
          height: 100,
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
                height: 25,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "More",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, FriendListScreen.routeName);
        },
      ),
    );
  }
}
