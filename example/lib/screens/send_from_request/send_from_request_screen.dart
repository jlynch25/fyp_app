import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/components/send_from_request_args.dart';

import '../../enums.dart';
import 'components/body.dart';

class SendFromRequestScreen extends StatelessWidget {
  static String routeName = "/send_from_request";

  @override
  Widget build(BuildContext context) {
    final SendFromRequestArguments args =
        ModalRoute.of(context)!.settings.arguments as SendFromRequestArguments;
    return Scaffold(
      appBar: AppBar(),
      body: Body(args.amount, args.recipient, args.address),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}