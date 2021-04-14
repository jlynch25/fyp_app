import 'package:flutter/material.dart';
import 'package:mylib_example/service/chat_service.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  final ChatService service;
  SignUpScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(this.service),
    );
  }
}
