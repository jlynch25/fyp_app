import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';

class Body extends StatefulWidget {
  final ChatService service;
  Body(this.service);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Set<User> users;

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
                              showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (_) => AlertDialog(
                                          title: Text(friend.name),
                                          // content: Text(friend.walletAddress),
                                          backgroundColor: Colors.teal,
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text('Send Money'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Close'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ]));
                            },
                          ))
                      .toList(),
                );
              }))
    ]));
  }
}
