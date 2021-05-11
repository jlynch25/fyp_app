import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/screens/profile/components/profile_menu.dart';
import 'package:mylib_example/screens/sign_in/sign_in_screen.dart';
// import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';
import 'dart:async';
import 'package:local_auth/local_auth.dart';

class Body extends StatefulWidget {
  final ChatService service;
  Body(this.service);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user = ChatService.user;
  String updateResult = "false";
  String blockchainResult = "false";
  String userBalance = "0";

  bool useLocalAuth = true;
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;

  @override
  void initState() {
    super.initState();

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

  Widget build(BuildContext context) {
    _checkBiometrics();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                " \n\t\t\t\tLog In to a different account",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ProfileMenu(
            text: "LogOut",
            icon: Icon(
              Icons.logout,
              size: getProportionateScreenWidth(18),
            ),
            press: () => {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  SignInScreen.routeName, (Route<dynamic> route) => false),
            },
          ),
          (_canCheckBiometrics!)
              ? Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          " \n\t\t\t\tLocal Authentication",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 25),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      SizedBox(width: getProportionateScreenWidth(25)),
                      Icon(Icons.fingerprint, color: Colors.blueAccent),
                      SizedBox(width: getProportionateScreenWidth(15)),
                      Text("Require Finger Auth for Transactions",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600)),
                      SizedBox(width: getProportionateScreenWidth(25)),
                      Switch(
                          value: useLocalAuth,
                          onChanged: (value) async {
                            setState(() {
                              useLocalAuth = value;
                            });
                          })
                    ]),
                  ],
                )
              : SizedBox(width: getProportionateScreenWidth(1)),
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                " \n\t\t\t\tDeveloper Tools",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ProfileMenu(
            text: "My Account",
            icon: Icon(
              Icons.account_circle,
              size: getProportionateScreenWidth(18),
            ),
            press: () => {_buildDialog(context, user.wallets.toString())},
          ),
          ProfileMenu(
            text: "create wallet",
            icon: Icon(
              Icons.request_quote,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              // user.walletAddress = await Mylib.blockchainCreateWallet("3000");

              try {
                await widget.service
                    .listXFriends("1")
                    .then((val) => setState(() {
                          print(val);
                        }));
              } on GrpcError catch (err) {
                _buildDialog(context, err.message!);
              }
              // if (updateResult == "true") {
              //   _buildDialog(context, "user.walletAddress");
              // } else {
              //   _buildDialog(context, updateResult);
              // }
            },
          ),
          ProfileMenu(
            text: "get Blockchain now",
            icon: Icon(
              Icons.account_balance,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
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
                Scaffold.of(context).showSnackBar(snackBar);
              } on FileSystemException catch (err) {
                final snackBar = SnackBar(
                  content: Text(err.message),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              }
            },
          ),
          ProfileMenu(
            text: "Create BlockChain",
            icon: Icon(
              Icons.create_new_folder,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                userBalance = (await Mylib.blockchainCreateBlockChain(
                    user.wallets[0].address, "3000"))!;
              } on Error catch (err) {
                _buildDialog(context, err.toString());
              }
              _buildDialog(context, userBalance);
            },
          ),
          ProfileMenu(
            text: "add/remove Friends",
            icon: Icon(
              Icons.group,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                await widget.service.addFriends([
                  // "606b92277f2162d6454fbe81",
                  // "606b344656d2e9c987d5f883",
                  // "6066faa235b24a12f4b8c471"
                  "60812b18497ac8be8651d507"
                ]).then((val) => setState(() {
                      updateResult = val!;
                    }));
              } on GrpcError catch (err) {
                _buildDialog(context, err.message!);
              }
              if (updateResult == "true") {
                _buildDialog(context, "done :)");
              } else {
                _buildDialog(context, updateResult);
              }
            },
          ),
          ProfileMenu(
            text: "Send curancy",
            icon: Icon(
              Icons.create_new_folder,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                // userBalance = await Mylib.blockchainSend(user.walletAddress,
                // "1HYjD8sMSzsNsRMErxZJcsnBKkCamBrdJm", 2, "3000", true);
              } on Error catch (err) {
                _buildDialog(context, err.toString());
              }
              _buildDialog(context, userBalance);
            },
          ),
          ProfileMenu(
            text: "join BlockChain network",
            icon: Icon(
              Icons.create_new_folder,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              try {
                // userBalance =
                // await Mylib.blockchainStartNode(user.wallet.address, "3000", [""]);
              } on Error catch (err) {
                _buildDialog(context, err.toString());
              }
              _buildDialog(context, userBalance);
            },
          ),
          ProfileMenu(
            text: "list Friends",
            icon: Icon(
              Icons.group,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              Navigator.pushNamed(context, FriendListScreen.routeName);
            },
          ),
        ],
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

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
