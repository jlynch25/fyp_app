import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/service/chat_service.dart';
// import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
// import 'package:mylib_example/enums.dart';

import '../../enums.dart';
import 'components/body.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";
  final ChatService service;
  final user = ChatService.user;
  SettingsScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Body(this.service),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
