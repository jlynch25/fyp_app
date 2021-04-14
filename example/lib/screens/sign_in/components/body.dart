import 'package:flutter/material.dart';
import 'package:mylib_example/screens/sign_in/components/sign_form_OLD.dart';
// import 'package:mylib_example/components/no_account_text.dart';
// import 'package:mylib_example/components/socal_card.dart';
import 'package:mylib_example/screens/sign_up/sign_up_screen.dart';

import 'package:mylib_example/service/chat_service.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  final ChatService service;
  Body(this.service);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignFormOLd(this.service),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(20)),
                // NoAccountText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, SignUpScreen.routeName),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kPrimaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
