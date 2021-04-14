import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';

TextEditingController titleController = new TextEditingController();

class AddFirstFriend extends StatefulWidget {
  final ChatService service;
  AddFirstFriend(this.service);
  @override
  _AddFirstFriendState createState() => _AddFirstFriendState();
}

class _AddFirstFriendState extends State<AddFirstFriend> {
  User user = ChatService.user;
  String updateResult = "false";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
      child: InkWell(
        child: Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.grey,
            //       offset: Offset(3, 1),
            //       blurRadius: 7,
            //       spreadRadius: 2)
            // ]
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.black45,
                    size: 30,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "Add",
                  //   style: TextStyle(color: Colors.black45, fontSize: 17),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Add your first friend",
                style: TextStyle(color: Colors.black45, fontSize: 17),
              ),
            ],
          ),
        ),
        onTap: () {
          // TODO
        },
      ),
    );
  }
}
