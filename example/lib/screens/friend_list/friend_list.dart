import 'package:flutter/material.dart';
import 'package:mylib_example/service/chat_service.dart';
// import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
// import 'package:mylib_example/enums.dart';

import 'components/body.dart';

class FriendListScreen extends StatelessWidget {
  static String routeName = "/friend_list";
  final ChatService service;
  FriendListScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: Body(this.service),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
