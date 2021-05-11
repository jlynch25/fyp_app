import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/home/home_screen.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';
import 'dart:async';
import 'package:local_auth/local_auth.dart';

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

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  _BodyState() {
    _wallets = user.wallets;
    _currentWalletSelected = user.wallets[0];
  }

  @override
  void initState() {
    super.initState();
    balance =
        Mylib.blockchainGetBalance(_currentWalletSelected.address, "3000");

    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );

    print("This device is ${_supportState.toString()}");
    _getAvailableBiometrics();
    print('Available biometrics: $_availableBiometrics');
    _checkBiometrics();
    print('Can check biometrics: $_canCheckBiometrics');
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

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: false);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });

    if (authenticated) {
      if (widget.amount.isNotEmpty &&
          widget.recipientAddress.isNotEmpty &&
          _currentWalletSelected.address.isNotEmpty) {
        try {
          output = await Mylib.blockchainSend(_currentWalletSelected.address,
              widget.recipientAddress, int.parse(widget.amount), "3000", true);

          final snackBar = SnackBar(
            content: Text(output),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } on Error catch (err) {
          print(err);
        }
        if (output == "Success!") {
          Navigator.pop(context);
          Navigator.pushNamed(context, HomeScreen.routeName);
        }
      }
    }
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
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
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    "To ${widget.recipientName} ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    "Their Primary Wallet's Address: ${widget.recipientAddress}",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Row(
                    children: [
                      Text(
                        "\t\t\t\tSelect Wallet to use",
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
                    "Your Wallet's Address: ${_currentWalletSelected.address}",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
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
                  SizedBox(height: getProportionateScreenHeight(40)),
                  DefaultButton(
                    text: "Send",
                    press: () async {
                      FocusScope.of(context).unfocus();
                      if (widget.amount.isNotEmpty &&
                          widget.recipientAddress.isNotEmpty &&
                          _currentWalletSelected.address.isNotEmpty) {
                        // LOCAL AUTH
                        if (_supportState == _SupportState.supported) {
                          // print("This device is supported");
                          // _getAvailableBiometrics();
                          // print('Available biometrics: $_availableBiometrics');
                          // _checkBiometrics();
                          // print('Can check biometrics: $_canCheckBiometrics');

                          if (_canCheckBiometrics!) {
                            _authenticateWithBiometrics();
                          } else {
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } on Error catch (err) {
                              print(err);
                            }
                            if (output == "Success!") {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, HomeScreen.routeName);
                            }
                          }
                        } else {
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } on Error catch (err) {
                            print(err);
                          }
                          if (output == "Success!") {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          }
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

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
