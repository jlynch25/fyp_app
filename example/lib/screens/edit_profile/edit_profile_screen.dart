import 'package:flutter/material.dart';
import 'package:mylib_example/components/edit_image_args.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/enums.dart';
import 'components/body.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "/edit_profile";
  final ChatService service;
  final user = ChatService.user;
  EditProfileScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Body(this.service),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
