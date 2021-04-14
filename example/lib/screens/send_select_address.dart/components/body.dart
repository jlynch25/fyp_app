import 'package:flutter/material.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';

import 'enter_address.dart';
import 'select_friend.dart';

class Body extends StatefulWidget {
  late final ChatService service;
  late final Function onEnteredFunction;
  Body(this.service, this.onEnteredFunction);
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            // EnterAddress(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25)),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        " \n\t\t\t\tEnter Adress",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // controller: address,
                    decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Enter the Address",
                      // If  you are using latest version of flutter then lable text and hint text shown like this
                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.account_balance_wallet_rounded,
                        size: getProportionateScreenWidth(18),
                      ), //CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                thickness: 1.5,
                color: Colors.black,
                indent: getProportionateScreenWidth(20),
              )),
              Text("OR"),
              Expanded(
                  child: Divider(
                thickness: 1.5,
                color: Colors.black,
                endIndent: getProportionateScreenWidth(20),
              )),
            ]),
            SizedBox(height: getProportionateScreenHeight(20)),
            // SelectFriend(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25)),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        " \n\t\t\t\tSelect a Friend",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
