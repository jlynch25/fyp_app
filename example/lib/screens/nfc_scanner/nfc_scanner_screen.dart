import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';

class NFCScannerScreen extends StatelessWidget {
  static String routeName = "/nfc_scanner";
  NFCScannerScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Scan a QR code"),
      // ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
