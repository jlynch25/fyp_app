import 'package:flutter/material.dart';
import 'package:mylib_example/screens/complete_profile/complete_profile_screen.dart';
import 'package:mylib_example/screens/home/components/request_card.dart';
import 'package:mylib_example/screens/home/components/send_card.dart';
import 'package:mylib_example/screens/nfc_scanner/nfc_scanner_screen.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
import 'package:mylib_example/screens/qr_maker.dart/qr_maker_screen.dart';
import 'package:mylib_example/screens/qr_scanner.dart/qr_scanner_screen.dart';
import 'package:mylib_example/screens/request_currency/request_curreny_screen.dart';
import 'package:mylib_example/screens/send_select_address.dart/send_select_address_screen.dart';
import 'package:mylib_example/service/chat_service.dart';

import '../../../size_config.dart';
import 'balance_card.dart';
import 'home_header.dart';
// import 'categories.dart';
// import 'discount_banner.dart';
// import 'home_header.dart';
// import 'popular_product.dart';
// import 'special_offers.dart';

class Body extends StatelessWidget {
  final ChatService service;
  Body(this.service);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: getProportionateScreenHeight(20)),
            SizedBox(height: getProportionateScreenWidth(25)),
            // DiscountBanner(),
            // Categories(),
            // SpecialOffers(),
            // SizedBox(
            //   width: double.infinity,
            //   child: Container(
            //     child: Text(
            //       " \n\t\t\t\tSend Currency",
            //       style: TextStyle(
            //           color: Colors.black.withOpacity(0.5), fontSize: 18),
            //       textAlign: TextAlign.left,
            //     ),
            //   ),
            // ),
            BalanceCard(),
            SizedBox(height: getProportionateScreenHeight(30)),
            SizedBox(
              width: double.infinity,
              child: Container(
                child: Text(
                  " \n\t\t\t\t\t\t\tPayment tools",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            RequestCard(
              icon2: Icons.account_balance_wallet_outlined,
              icon1: Icons.supervised_user_circle_outlined,
              text: "Send Currency",
              press: SendSelectAdressScreen.routeName, //TODO
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              // scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: getProportionateScreenWidth(20)),
                SizedBox(
                  width: getProportionateScreenWidth(90),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        height: getProportionateScreenWidth(100),
                        width: getProportionateScreenWidth(90),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Used when currency is requested from you",
                                textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                SendCard(
                  icon: Icons.qr_code_scanner,
                  text: "Scan Qr Code",
                  press: QrScannerScreen.routeName, //TODO
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                SendCard(
                  icon: Icons.contactless_outlined,
                  text: "Pay by NFC",
                  press: NFCScannerScreen.routeName, //TODO
                ),
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   width: double.infinity,
            //   child: Container(
            //     child: Text(
            //       " \n\t\t\t\tReceive Currency",
            //       style: TextStyle(
            //           color: Colors.black.withOpacity(0.5), fontSize: 18),
            //       textAlign: TextAlign.left,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   height: 120,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: <Widget>[
            //       // widget.service
            //       SendCard(
            //         icon: Icons.qr_code,
            //         text: "Make Qr Code",
            //         press: QrMakerScreen.routeName, //TODO
            //       ),
            //       SendCard(
            //         icon: Icons.contactless_outlined,
            //         text: "NFC",
            //         press: CompleteProfileScreen.routeName, //TODO
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: getProportionateScreenWidth(30)),
            RequestCard(
              icon2: Icons.contactless,
              icon1: Icons.qr_code,
              text: "Request Currency",
              press: RequestCurrencyScreen.routeName, //TODO
            ),
            // PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
