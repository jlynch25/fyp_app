import 'package:flutter/material.dart';
import 'package:mylib_example/screens/home/components/user_search.dart';

import '../../../size_config.dart';

class EnterAddress extends StatefulWidget {
  final Function onEnteredFunction;
  const EnterAddress({
    Key? key, required this.onEnteredFunction,
  }) : super(key: key);

  _EnterAddressState createState() => _EnterAddressState();
}

class _EnterAddressState extends State<EnterAddress> {
  final address = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
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
            controller: address,
            
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
    );
  }
}
