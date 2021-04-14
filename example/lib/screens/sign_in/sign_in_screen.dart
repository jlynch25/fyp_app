import 'package:flutter/material.dart';
import 'package:mylib_example/service/chat_service.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  final ChatService service;
  SignInScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(this.service),
    );
  }
}
