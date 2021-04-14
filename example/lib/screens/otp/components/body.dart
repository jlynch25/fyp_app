import 'package:flutter/material.dart';
import 'package:mylib_example/constants.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/size_config.dart';
import 'package:mylib_example/service/chat_service.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  static User user = ChatService.user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              // FIXME - ${ChatService.user.phoneNumber}
              Text("We sent your code to ${ChatService.user.phoneNumber}"),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // TODO - OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 100.0, end: 0.0),
          duration: Duration(seconds: 100),
          builder: (_, value, child) => Text(
            // "00:${value.toInt()}",
            "00:$value",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
