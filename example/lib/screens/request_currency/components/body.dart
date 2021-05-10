import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

import '../../../constants.dart';
// import 'package:nfc_manager/nfc_manager.dart';

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
  late bool isSwitchedQR = false;
  late bool isSwitchedNFC = false;
  bool _supportsNFC = false;
  ValueNotifier<dynamic> result = ValueNotifier(null);
  _BodyState() {
    _wallets = user.wallets;
    _currentWalletSelected = user.wallets[0];
  }

  @override
  void initState() {
    super.initState();
    // Check if the device supports NFC reading
    NFC.isNDEFSupported.then((bool isSupported) {
      setState(() {
        _supportsNFC = isSupported;
      });
    });
  }

  void _onDropDownWalletSelected(Wallet newValueSelected) {
    setState(() {
      this._currentWalletSelected = newValueSelected;
    });
  }

  void _onCreateQR(bool value) {
    setState(() {
      this.isSwitchedQR = value;
    });
  }

  void _onCreateNFC(bool value) {
    setState(() {
      this.isSwitchedNFC = value;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amount.dispose();
    super.dispose();
  }

  late StreamSubscription<NDEFMessage> _stream;
  List<String> _records = [];
  bool _hasClosedWriteDialog = false;

  void _addRecord(String value) {
    setState(() {
      _records.add(value);
    });
  }

  void _write(BuildContext context) async {
    List<NDEFRecord> records = _records.map((record) {
      return NDEFRecord.type(
        "text/plain",
        record,
      );
    }).toList();
    NDEFMessage message = NDEFMessage.withRecords(records);

    // Show dialog on Android (iOS has it's own one)
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Ready to Request by NFC"),
          content: SizedBox(
              width: getProportionateScreenHeight(150),
              height: getProportionateScreenHeight(150),
              child: Column(children: [
                Icon(
                  Icons.contactless_outlined,
                  size: getProportionateScreenWidth(75),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text("tap phones"),
                Text("(back to back)"),
              ])),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
                _hasClosedWriteDialog = true;
                // _stream.cancel();
              },
            ),
          ],
        ),
      );
    }

    // Write to the first tag scanned
    NDEFTag SENT = await NFC.writeNDEF(message, once: true).first;
    print("SENT");
    print(SENT);
    if (!_hasClosedWriteDialog) {
      Navigator.pop(context);
    }
  }

  Future<Uint8List> toQrImageData() async {
    try {
      final image = await QrPainter(
        data: """{
                  "amount": "${amount.text}",
                  "reciever": "${user.name}",
                  "address":  "${_currentWalletSelected.address}"
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
                      "Request Currency",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    new TextField(
                      controller: amount,
                      onChanged: (value) {
                        _onCreateQR(false);
                        _onCreateNFC(false);
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
                            _onCreateQR(false);
                            _onCreateNFC(false);
                            FocusScope.of(context).unfocus();
                          },
                          value: _currentWalletSelected,
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      "Address: ${_currentWalletSelected.address}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),

                    _supportsNFC
                        ? (Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getProportionateScreenHeight(150),
                                  height: getProportionateScreenHeight(80),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          (amount.text.isNotEmpty &&
                                                  _currentWalletSelected
                                                      .address.isNotEmpty)
                                              ? kPrimaryColor
                                              : kSecondaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    onPressed: () async {
                                      if (amount.text.isNotEmpty &&
                                          _currentWalletSelected
                                              .address.isNotEmpty) {
                                        _onCreateQR(true);
                                        _onCreateNFC(false);
                                        FocusScope.of(context).unfocus();
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.qr_code,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                            width: getProportionateScreenWidth(
                                                10)),
                                        Text(
                                          "QR code",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(20)),
                                SizedBox(
                                  width: getProportionateScreenHeight(150),
                                  height: getProportionateScreenHeight(80),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          (amount.text.isNotEmpty &&
                                                  _currentWalletSelected
                                                      .address.isNotEmpty)
                                              ? kPrimaryColor
                                              : kSecondaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    onPressed: () async {
                                      if (amount.text.isNotEmpty &&
                                          _currentWalletSelected
                                              .address.isNotEmpty) {
                                        _onCreateNFC(true);
                                        _onCreateQR(false);
                                        FocusScope.of(context).unfocus();

                                        _addRecord(
                                            """{ "amount": "${amount.text}", "reciever": "${user.name}", "address":  "${_currentWalletSelected.address}" }""");

                                        if (_records.length > 0) {
                                          _write(context);
                                        }
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.contactless_outlined,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                            width: getProportionateScreenWidth(
                                                10)),
                                        Text(
                                          "NFC",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]))
                        : DefaultButton(
                            text: "Make a QR code",
                            press: () async {
                              if (amount.text.isNotEmpty &&
                                  _currentWalletSelected.address.isNotEmpty) {
                                _onCreateQR(true);
                                _onCreateNFC(false);
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),

                    SizedBox(height: getProportionateScreenHeight(40)),

                    // QR CODE MAKING START
                    isSwitchedQR
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
                    // QR CODE MAKING END

                    // // NFC START
                    // isSwitchedNFC
                    //     ? (Column(children: [
                    //         Icon(
                    //           Icons.contactless_outlined,
                    //           size: getProportionateScreenWidth(75),
                    //         ),
                    //         SizedBox(height: getProportionateScreenHeight(30)),
                    //         Text('Ready to Request by NFC'),
                    //         // Text('waiting for another device'),
                    //         ValueListenableBuilder<dynamic>(
                    //           valueListenable: result,
                    //           builder: (context, value, _) =>
                    //               Text('${value ?? ''}'),
                    //         ),
                    //       ]))
                    //     : SizedBox(height: getProportionateScreenHeight(30)),
                    // // NFC END
                  ],
                ))));
  }

  // void _ndefWrite() {
  //   NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
  //     var ndef = Ndef.from(tag);
  //     if (ndef == null || !ndef.isWritable) {
  //       result.value = 'Tag is not ndef writable';
  //       NfcManager.instance.stopSession(errorMessage: result.value);
  //       return;
  //     }

  //     NdefMessage message = NdefMessage([
  //       NdefRecord.createText('Hello World!'),
  //       NdefRecord.createUri(Uri.parse('https://github.com/jlynch25')),
  //       NdefRecord.createMime(
  //           'text/plain', Uint8List.fromList('Hello'.codeUnits)),
  //       NdefRecord.createExternal(
  //           'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
  //     ]);

  //     try {
  //       await ndef.write(message);
  //       result.value = 'Success to "Ndef Write"';
  //       NfcManager.instance.stopSession();
  //     } catch (e) {
  //       result.value = e;
  //       NfcManager.instance.stopSession(errorMessage: result.value.toString());
  //       return;
  //     }
  //   });
  // }
}
