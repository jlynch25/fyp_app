import 'dart:io';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/edit_profile/edit_profile_screen.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/screens/settings/settings_screen.dart';
// import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';

import 'addFriend.dart';
import 'addWallet.dart';
import 'addfirstFriend.dart';
import 'card.dart';
import 'friendCard.dart';
import 'moreFriends.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  final ChatService service;
  Body(this.service);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user = ChatService.user;
  String updateResult = "false";
  String blockchainResult = "false";
  String userBalance = "0";
  late Future<List<User>> friends;

  @override
  void initState() {
    super.initState();
    friends = widget.service.listXFriends("2");
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // SizedBox(width: 20),
            ProfilePic(),
            // SizedBox(width: 30),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                "${user.name}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushNamed(context, EditProfileScreen.routeName);
                    },
                    icon: Icon(Icons.edit, size: 18),
                    label: Text("Edit"),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                    icon: Icon(Icons.settings, size: 18),
                    label: Text("Settings"),
                  ),
                ],
              ),
              //
            ]),
          ]),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                " \n\t\t\t\tYour Wallets",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (var wallet in user.wallets)
                  WalletCard(
                    color: Colors.orangeAccent, //.lightGreen,
                    wallet: wallet,
                    service: widget.service,
                  ),
                AddWallet(widget.service),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                " \n\t\t\t\tYour Friends",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          FutureBuilder(
              future: friends,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length > 0) {
                    return Container(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          AddFriend(widget.service),
                          for (var friend in snapshot.data)
                            FriendCard(
                              image: friend.name,
                              friend: friend,
                              service: widget.service,
                            ),
                          MoreFriends(widget.service),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          AddFirstFriend(widget.service),
                        ],
                      ),
                    );
                  }
                } else {
                  return Container(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        AddFirstFriend(widget.service),
                      ],
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}

Widget? _buildDialog(BuildContext context, String err) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(title: Text(err), actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]));
  return null;
}
