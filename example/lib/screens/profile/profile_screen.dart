import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/service/chat_service.dart';
// import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
// import 'package:mylib_example/enums.dart';

import '../../enums.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  final ChatService service;
  final user = ChatService.user;
  ProfileScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(user.name),
        automaticallyImplyLeading: false,
      ),
      body: Body(this.service),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
