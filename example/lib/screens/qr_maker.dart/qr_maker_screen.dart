import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';

import '../../enums.dart';
import 'components/body.dart';

class QrMakerScreen extends StatelessWidget {
  static String routeName = "/qr_maker";
  QrMakerScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(
          //   "Make a QR code",
          //   style: Theme.of(context).textTheme.headline4,
          // ),
          ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
