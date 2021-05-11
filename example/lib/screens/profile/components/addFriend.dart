import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';

TextEditingController titleController = new TextEditingController();

class AddFriend extends StatefulWidget {
  final ChatService service;
  AddFriend(this.service);
  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
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
              color: Colors.black,
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
                height: 25,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Add",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SizedBox(
                height: 10,
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
