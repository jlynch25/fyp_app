import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
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
          Row(children: [
            SizedBox(width: 20),
            ProfilePic(),
            SizedBox(width: 50),
            Column(children: [
              Text(
                "${user.name}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              OutlinedButton.icon(
                onPressed: () {
                  // Respond to button press
                },
                icon: Icon(Icons.edit, size: 18),
                label: Text("Edit Profile"),
              )
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
                    color: Colors.lightGreen,
                    address: wallet.address,
                    name: wallet.title,
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
                              name: friend.name,
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
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        AddFriend(widget.service),
                      ],
                    ),
                  );
                }
              }),
          ProfileMenu(
            text: "My Account",
            icon: Icon(
              Icons.account_circle,
              size: getProportionateScreenWidth(18),
            ),
            press: () => {_buildDialog(context, user.wallets.toString())},
          ),
          ProfileMenu(
            text: "create wallet",
            icon: Icon(
              Icons.request_quote,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              // user.walletAddress = await Mylib.blockchainCreateWallet("3000");

              try {
                await widget.service
                    .listXFriends("1")
                    .then((val) => setState(() {
                          print(val);
                        }));
              } on GrpcError catch (err) {
                _buildDialog(context, err.message!);
              }
              // if (updateResult == "true") {
              //   _buildDialog(context, "user.walletAddress");
              // } else {
              //   _buildDialog(context, updateResult);
              // }
            },
          ),
          ProfileMenu(
            text: "balance",
            icon: Icon(
              Icons.account_balance,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              // userBalance =
              // await Mylib.blockchainGetBalance(user.walletAddress, "3000");

              // _buildDialog(context, userBalance);
            },
          ),
          ProfileMenu(
            text: "Create BlockChain",
            icon: Icon(
              Icons.create_new_folder,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                // userBalance = await Mylib.blockchainCreateBlockChain(
                // user.walletAddress, "3000");
              } on Error catch (err) {
                _buildDialog(context, err.toString());
              }
              _buildDialog(context, userBalance);
            },
          ),
          ProfileMenu(
            text: "add/remove Friends",
            icon: Icon(
              Icons.group,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                await widget.service.addFriends([
                  "606b92277f2162d6454fbe81",
                  "606b344656d2e9c987d5f883",
                  "6066faa235b24a12f4b8c471"
                ]).then((val) => setState(() {
                      updateResult = val!;
                    }));
              } on GrpcError catch (err) {
                _buildDialog(context, err.message!);
              }
              if (updateResult == "true") {
                _buildDialog(context, "done :)");
              } else {
                _buildDialog(context, updateResult);
              }
            },
          ),
          ProfileMenu(
            text: "Send curancy",
            icon: Icon(
              Icons.create_new_folder,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                // userBalance = await Mylib.blockchainSend(user.walletAddress,
                // "1HYjD8sMSzsNsRMErxZJcsnBKkCamBrdJm", 2, "3000", true);
              } on Error catch (err) {
                _buildDialog(context, err.toString());
              }
              _buildDialog(context, userBalance);
            },
          ),
          ProfileMenu(
            text: "join BlockChain network",
            icon: Icon(
              Icons.create_new_folder,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                // userBalance =
                // await Mylib.blockchainStartNode(user.wallet.address, "3000");
              } on Error catch (err) {
                _buildDialog(context, err.toString());
              }
              _buildDialog(context, userBalance);
            },
          ),
          ProfileMenu(
            text: "list Friends",
            icon: Icon(
              Icons.group,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              Navigator.pushNamed(context, FriendListScreen.routeName);
            },
          ),
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
