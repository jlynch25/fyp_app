import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/components/send_args.dart';
import 'package:mylib_example/protos/service.pb.dart';

import '../../enums.dart';
import 'components/body.dart';

class SendScreen extends StatelessWidget {
  static String routeName = "/send";

  @override
  Widget build(BuildContext context) {
    final SendArguments args =
        ModalRoute.of(context)!.settings.arguments as SendArguments;
    return Scaffold(
      appBar: AppBar(),
      body: Body(args.recipient, args.address),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}