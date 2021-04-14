import 'package:flutter/material.dart';
import 'package:mylib_example/components/coustom_bottom_nav_bar.dart';
import 'package:mylib_example/components/send_args.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/send.dart/send_screen.dart';
import 'package:mylib_example/service/chat_service.dart';

import '../../enums.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/enter_address.dart';

class SendSelectAdressScreen extends StatefulWidget {
  static String routeName = "/send_select_address";
  late final ChatService service;
  SendSelectAdressScreen(this.service);

  _SendSelectAdressScreenState createState() => _SendSelectAdressScreenState();
}

class _SendSelectAdressScreenState extends State<SendSelectAdressScreen> {
  TextEditingController address = TextEditingController();
  late User recipient = User(name: "an unknown user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipient"),
      ),
      body:
          SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
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
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: address,
                      decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter the Address",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.account_balance_wallet_rounded,
                          size: getProportionateScreenWidth(18),
                        ),
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
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // TODO
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (address.text.isNotEmpty) {
            Navigator.pushNamed(context, SendScreen.routeName,
                arguments: SendArguments(this.recipient, this.address.text));
          }
        },
        tooltip: 'Continue',
        child: Icon(Icons.navigate_next),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
