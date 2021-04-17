import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';

import '../../enums.dart';
import 'components/body.dart';

class QrScannerScreen extends StatelessWidget {
  static String routeName = "/qrscanner";
  QrScannerScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}