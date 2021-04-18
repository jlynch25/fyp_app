import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';

import '../../enums.dart';
import 'components/body.dart';

class NetworkScreen extends StatelessWidget {
  static String routeName = "/network";
  final ChatService service;
  NetworkScreen(this.service);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Network"),
        automaticallyImplyLeading: false,
      ),
      body: Body(this.service),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.network),
    );
  }
}
