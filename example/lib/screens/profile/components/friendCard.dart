import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/service/chat_service.dart';

TextEditingController titleController = new TextEditingController();

class FriendCard extends StatefulWidget {
  final String image;
  final String name;

  FriendCard({required this.image, required this.name});
  @override
  _FriendCardState createState() => _FriendCardState(this.image, this.name);
}

class _FriendCardState extends State<FriendCard> {
  final String image;
  final String name;

  _FriendCardState(this.image, this.name);

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
                "$name",
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
          Navigator.pushNamed(context, FriendListScreen.routeName);
        },
      ),
    );
  }
}
