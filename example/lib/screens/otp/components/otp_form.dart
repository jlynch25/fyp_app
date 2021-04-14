import 'package:flutter/material.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/screens/login_success/login_success_screen.dart';
import 'package:mylib_example/size_config.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late String otpCode1;
  late String otpCode2;
  late String otpCode3;
  late String otpCode4;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onSaved: (newValue) => otpCode1 = newValue!,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onSaved: (newValue) => otpCode2 = newValue!,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  onSaved: (newValue) => otpCode3 = newValue!,
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onSaved: (newValue) => otpCode4 = newValue!,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // TODO - otp server side
                //   try {
                //     await widget.service
                //         .loginUser(this.email, this.password)
                //         .then((val) => setState(() {
                //               loginScceusful = val;
                //             }));
                //   } on GrpcError catch (err) {
                //     _buildDialog(context, err.message);
                //   }

                //   if (loginScceusful == "true") {
                //     // if all are valid then go to success screen
                //     Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                //   } else {
                //     _buildDialog(context, loginScceusful);
                //   }
                print("otpCode");
                print(otpCode1 + otpCode2 + otpCode3 + otpCode4);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }
}
