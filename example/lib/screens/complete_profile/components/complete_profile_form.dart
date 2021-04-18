import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/components/form_error.dart';
import 'package:mylib_example/files.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/home/home_screen.dart';
// import 'package:flutterClient/screens/otp/otp_screen.dart';
import 'package:mylib_example/screens/login_success/login_success_screen.dart';
import 'package:mylib_example/screens/otp/otp_screen.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:grpc/grpc.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  final ChatService service;
  CompleteProfileForm(this.service);
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  User user = User();
  late String displayName;
  late String phoneNumber;
  String updateResult = "false";
  String blockchainResult = "false";

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
          buildDisplayNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                user.name = displayName;
                user.phoneNumber = phoneNumber;

                try {
                  await widget.service
                      .updateUser(user)
                      .then((val) => setState(() {
                            updateResult = val!;
                          }));
                } on GrpcError catch (err) {
                  _buildDialog(context, err.message!);
                }

                if (updateResult == "true") {
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, HomeScreen.routeName);

                  updateResult = "false";
                  // Lets do some backgound work
                  // add first wallet
                  if (ChatService.user.wallets.isEmpty) {
                    try {
                      String newAddress =
                          (await Mylib.blockchainCreateWallet("3000"))!;

                      Wallet wallet = Wallet();
                      wallet.title = "Primary";
                      wallet.address = newAddress;
                      await widget.service
                          .addWallet(wallet)
                          .then((val) => setState(() {
                                updateResult = val!;
                              }));
                    } on GrpcError catch (err) {
                      // _buildDialog(context, err.message);
                      final snackBar = SnackBar(
                        content: Text(err.message!),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                    if (updateResult == "true") {
                      print("A Wallet exists");
                    } else {
                      // _buildDialog(context, updateResult);
                      final snackBar = SnackBar(
                        content: Text(updateResult),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  }
                  // TODO - download inital blockchain
                  updateResult = "false";

                  blockchainResult = (await blockchainExists())!;
                  if (blockchainResult == "false") {
                    print("Requesting Blockchain");
                    try {
                      await widget.service
                          .downloadGenBlock()
                          .then((val) => setState(() {
                                blockchainResult = val!;
                              }));
                    } on GrpcError catch (err) {
                      // _buildDialog(context, err.message);
                      final snackBar = SnackBar(
                        content: Text(err.message!),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } on FileSystemException catch (err) {
                      final snackBar = SnackBar(
                        content: Text(err.message),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {
                    print("Blockchain exists");
                  }
                  //
                  // TODO - grpc get bootstrap ip addresses for blopckchain network
                  //
                  // TODO - start node (with timeout ) only need to wait if an error is returned

                } else {
                  _buildDialog(context, updateResult);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.phone,
          size: getProportionateScreenWidth(18),
        ), //CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildDisplayNameFormField() {
    return TextFormField(
      onSaved: (newValue) => displayName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Your Name",
        hintText: "Enter your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.person,
          size: getProportionateScreenWidth(18),
        ), //CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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
