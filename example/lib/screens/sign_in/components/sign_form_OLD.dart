import 'package:flutter/material.dart';
// import 'package:flutterClient/components/custom_surfix_icon.dart';
import 'package:mylib_example/components/form_error.dart';
import 'package:mylib_example/screens/forgot_password/forgot_password_screen.dart';
import 'package:mylib_example/screens/home/home_screen.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';

import 'package:mylib_example/service/chat_service.dart';
import 'package:grpc/grpc.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignFormOLd extends StatefulWidget {
  final ChatService service;
  SignFormOLd(this.service);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignFormOLd> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool remember = false;
  final List<String> errors = [];
  String loginScceusful = "false";

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                try {
                  await widget.service
                      .loginUser(this.email, this.password)
                      .then((val) => setState(() {
                            loginScceusful = val!;
                          }));
                } on GrpcError catch (err) {
                  _buildDialog(context, err.message!);
                }
                if (loginScceusful == "true") {
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, HomeScreen.routeName);
                } else {
                  _buildDialog(context, loginScceusful);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 7) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 7) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
          size: getProportionateScreenWidth(18),
        ), //CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.mail,
          ) //CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          ),
    );
  }
}

Widget? _buildDialog(BuildContext context, String err) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(title: Text(err), actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]));
  return null;
}
