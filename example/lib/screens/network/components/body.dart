import 'dart:convert';
import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/service/chat_service.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  final ChatService service;
  Body(this.service);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late bool isSwitched = false;
  final user = ChatService.user;
  late String? output;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isSwitched ? "Connected" : "Connect"),
                SizedBox(width: getProportionateScreenWidth(10)),
                Switch(
                  value: isSwitched,
                  onChanged: (value) async {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                    
                    
                    // print("staring node");
                    // output = await Mylib.blockchainStartNode(
                    //     user.wallets[0].address, "3000");
                    // print(output);
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ],
            ),
            isSwitched
                ? (Column(children: [
                    Text(
                      " \n\t\t\t\tYour Friends",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ]))
                : SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
