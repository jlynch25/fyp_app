import 'package:flutter/material.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/home/home_screen.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';

class Body extends StatefulWidget {
  final String recipientAddress;
  final String amount;
  final String recipientName;
  Body(this.amount, this.recipientName, this.recipientAddress);
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user = ChatService.user;
  late List<Wallet> _wallets;
  late Wallet _currentWalletSelected;
  late int _balance = 0;
  late int _newbalance = _balance - int.parse(widget.amount);
  late Future<String?> balance;
  late String output;
  _BodyState() {
    _wallets = user.wallets;
    _currentWalletSelected = user.wallets[0];
  }

  @override
  void initState() {
    super.initState();
    balance =
        Mylib.blockchainGetBalance(_currentWalletSelected.address, "3000");
  }

  void _onDropDownWalletSelected(Wallet newValueSelected) {
    setState(() {
      this._currentWalletSelected = newValueSelected;
    });

    setState(() async {
      this.balance =
          Mylib.blockchainGetBalance(_currentWalletSelected.address, "3000");
      this._balance = int.parse((await balance)!);
      if (widget.amount.isEmpty) {
        this._newbalance = _balance;
      } else {
        this._newbalance = _balance - int.parse(widget.amount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(23)),
              child: Column(
                children: [
                  Text(
                    "Send ₿${widget.amount} ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Text(
                    "To ${widget.recipientName} ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    "Their Address: ${widget.recipientAddress}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Row(
                    children: [
                      Text(
                        "Select Wallet to use",
                        style: Theme.of(context).textTheme.button,
                      ),
                      SizedBox(width: getProportionateScreenHeight(100)),
                      DropdownButton<Wallet>(
                        items: _wallets.map((Wallet dropDownItem) {
                          return DropdownMenuItem<Wallet>(
                            value: dropDownItem,
                            child: Text(dropDownItem.title),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _onDropDownWalletSelected(value!);
                        },
                        value: _currentWalletSelected,
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    "Your Address: ${_currentWalletSelected.address}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  FutureBuilder(
                      future: balance,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          _balance = int.parse(snapshot.data);
                          return Text(
                            "Current Balance: ₿${_balance.toString()} New Balance will be: ₿${_newbalance.toString()}",
                            style: Theme.of(context).textTheme.bodyText1,
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  DefaultButton(
                    text: "Send",
                    press: () async {
                      if (widget.amount.isNotEmpty &&
                          widget.recipientAddress.isNotEmpty &&
                          _currentWalletSelected.address.isNotEmpty) {
                        try {
                          output = await Mylib.blockchainSend(
                              _currentWalletSelected.address,
                              widget.recipientAddress,
                              int.parse(widget.amount),
                              "3000",
                              true);

                          final snackBar = SnackBar(
                            content: Text(output),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        } on Error catch (err) {
                          print(err);
                        }
                        if (output == "Success!") {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        }
                      }
                    },
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
