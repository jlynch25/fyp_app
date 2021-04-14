import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/enums.dart';
import 'package:mylib_example/service/chat_service.dart';

import '../../enums.dart';
import 'components/body.dart';
import 'components/icon_btn_with_counter.dart';
import 'components/user_search.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  final ChatService service;
  HomeScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconBtnWithCounter(
            svgSrc: Icons.search,
            press: () {
              showSearch(context: context, delegate: UserSearch());
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Body(this.service),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
