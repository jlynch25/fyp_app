import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/files.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';

import '../profile_screen.dart';

class WalletCard extends StatefulWidget {
  final Color color;
  final Wallet wallet;
  final ChatService service;

  WalletCard(
      {required this.color, required this.wallet, required this.service});

  @override
  _WalletCardState createState() =>
      _WalletCardState(this.color, this.wallet.address, this.wallet.title);
}

class _WalletCardState extends State<WalletCard> {
  User user = ChatService.user;
  late Future<String?> balance;
  final Color color;
  final String address;
  final String name;
  String _balance = "0";
  String updateResult = "false";
  _WalletCardState(this.color, this.address, this.name);

  @override
  void initState() {
    super.initState();
    balance = Mylib.blockchainGetBalance(address, "3000");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
      child: InkWell(
        child: Container(
          height: 180,
          width: 300,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 1),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 1,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder(
                          future: balance,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              _balance = snapshot.data;
                              return Row(children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  snapshot.data,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Text(
                                  ".00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ]);
                            } else {
                              return Row(children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                                CircularProgressIndicator(),
                              ]);
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        // const PopupMenuItem(
                        //   child: ListTile(
                        //     leading: Icon(Icons.edit),
                        //     title: Text('Edit Title'),
                        //   ),
                        //   value: 0,
                        // ),
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
                            title: Text('Delete Wallet'),
                          ),
                          value: 2,
                        ),
                      ],
                      onSelected: (result) {
                        if (result == 0) {
                          //TODO edit wallet name
                        } else if (result == 1) {
                          Clipboard.setData(new ClipboardData(text: address))
                              .then((result) {
                            final snackBar = SnackBar(
                              content: Text('Copied Address to Clipboard'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        } else if (result == 2) {
                          if (int.parse(_balance) > 0) {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => AlertDialog(
                                        title: Text(
                                            "It is not recommended to delete a wallet, which is not empty."),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ]));
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => AlertDialog(
                                        title: Text(
                                            "Are you sure want to delete your $name wallet?"),
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
                                              try {
                                                // TODO posible remove wallet from device

                                                await widget.service
                                                    .removeWallet(widget.wallet)
                                                    .then((val) => setState(() {
                                                          updateResult = val!;
                                                        }));
                                              } on GrpcError catch (err) {
                                                // _buildDialog(context, err.message);
                                                final snackBar = SnackBar(
                                                  content: Text(err.message!),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }
                                              if (updateResult == "true") {
                                                final snackBar = SnackBar(
                                                  content:
                                                      Text('Removed Wallet'),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                setState(() {});
                                              } else {
                                                // _buildDialog(context, updateResult);
                                                final snackBar = SnackBar(
                                                  content: Text(updateResult),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }

                                              Navigator.pop(context);
                                              Navigator.pushNamed(context,
                                                  ProfileScreen.routeName);
                                            },
                                          ),
                                        ]));
                          }
                        }
                      },
                    ),
                    // Icon(
                    //   Icons.more_vert,
                    //   color: Colors.white,
                    // ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "\t\t${name.toUpperCase()}\n\n",
                          style: TextStyle(color: Colors.black, fontSize: 22)),
                      TextSpan(
                          text: "$address",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 13)),
                      // TextSpan(
                      //     text: "${user.name.toUpperCase()}",
                      //     style: TextStyle(color: Colors.black, fontSize: 14)),
                    ], style: TextStyle(fontSize: 14))),
                  ),
                ],
              )
            ],
          ),
        ),
        onLongPress: () {
          Clipboard.setData(new ClipboardData(text: address)).then((result) {
            final snackBar = SnackBar(
              content: Text('Copied Address to Clipboard'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
      ),
    );
  }
}
