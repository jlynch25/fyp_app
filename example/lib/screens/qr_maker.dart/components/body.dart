import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey globalKey = new GlobalKey();
  User user = ChatService.user;
  TextEditingController amount = TextEditingController();
  late List<Wallet> _wallets;
  late Wallet _currentWalletSelected;
  late bool isSwitched = false;
  _BodyState() {
    _wallets = user.wallets;
    _currentWalletSelected = user.wallets[0];
  }

  void _onDropDownWalletSelected(Wallet newValueSelected) {
    setState(() {
      this._currentWalletSelected = newValueSelected;
    });
  }

  void _onCreate(bool value) {
    setState(() {
      this.isSwitched = value;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(23)),
                child: Column(
                  children: [
                    Text(
                      "Make a QR code",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    new TextField(
                      controller: amount,
                      onChanged: (value) {
                        _onCreate(false);
                      },
                      decoration: new InputDecoration(
                        labelText: "Amount",
                        hintText: "Enter the Amount",
                        suffixIcon: Icon(
                          Icons.attach_money_rounded,
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      children: [
                        Text(
                          "Select your Wallet",
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
                            _onCreate(false);
                            FocusScope.of(context).unfocus();
                          },
                          value: _currentWalletSelected,
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    DefaultButton(
                      text: "Create",
                      press: () async {
                        if (amount.text.isNotEmpty &&
                            _currentWalletSelected.address.isNotEmpty) {
                          _onCreate(true);
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    isSwitched
                        ? (Column(children: [
                            RepaintBoundary(
                                key: globalKey,
                                child: QrImage(
                                  data: """{
                                            "amount": "${amount.text}",
                                            "reciever": "${user.name}",
                                            "address":  "${_currentWalletSelected.address}"
                                            }""",
                                  version: QrVersions.auto,
                                  size: 250,
                                  gapless: false,

                                  // embeddedImage: AssetImage(
                                  //     'lib/assets/images/blockchain-vector-graphics.png'),
                                  // embeddedImageStyle: QrEmbeddedImageStyle(
                                  //   color: Colors.black,
                                  //   size: Size(100, 100),
                                  // ),
                                  foregroundColor: Colors.teal,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: _captureAndSharePng,
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(20)),
                                IconButton(
                                  icon: Icon(Icons.print),
                                  onPressed: _captureAndSharePng,
                                )
                              ],
                            ),
                          ]))
                        : SizedBox(height: getProportionateScreenHeight(30)),
                  ],
                ))));
  }

  Future<Uint8List> toQrImageData() async {
    try {
      final image = await QrPainter(
        data: """Transaction{
                  amount: ${amount.text},
                  reciever: ${user.name},
                  wallet{ $_currentWalletSelected },
                }""",
        version: QrVersions.auto,
        gapless: false,
        color: Colors.teal,
      ).toImage(300);
      final a = await image.toByteData(format: ImageByteFormat.png);
      return a!.buffer.asUint8List();
    } catch (e) {
      throw e;
    }
  }

  Future<void> _captureAndSharePng() async {
    try {
      //  RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      //   var image = await boundary.toImage();
      // ByteData byteData =
      //     (await image.toByteData(format: ImageByteFormat.png))!;
      // Uint8List pngBytes = byteData.buffer.asUint8List();

      var pngBytes = await toQrImageData();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      Share.shareFiles(['${tempDir.path}/image.png'], text: 'Share QR code');
    } catch (e) {
      print(e.toString());
    }
  }
}
