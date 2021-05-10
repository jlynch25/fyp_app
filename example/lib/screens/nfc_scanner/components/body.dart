import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/components/nfc_session.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
// import 'package:nfc_manager/nfc_manager.dart';
// import 'package:provider/provider.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // GlobalKey globalKey = new GlobalKey();
  // User user = ChatService.user;
  // ValueNotifier<dynamic> result = ValueNotifier(null);

  // late bool isSwitched = false;

  // void _onCreate(bool value) {
  //   setState(() {
  //     this.isSwitched = value;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //       child: SingleChildScrollView(
  //           child: Padding(
  //               padding: EdgeInsets.symmetric(
  //                   horizontal: getProportionateScreenWidth(23)),
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     "Make a QR code",
  //                     style: Theme.of(context).textTheme.headline4,
  //                   ),
  //                   SizedBox(height: getProportionateScreenHeight(30)),
  //                   DefaultButton(
  //                     text: "Create",
  //                     press: () async {
  //                       _onCreate(true);
  //                       // _tagRead();
  //                     },
  //                   ),
  //                   SizedBox(height: getProportionateScreenHeight(40)),
  //                   isSwitched
  //                       ? (Column(children: [
  //                           Icon(
  //                             Icons.contactless_outlined,
  //                             size: getProportionateScreenWidth(75),
  //                           ),
  //                           SizedBox(height: getProportionateScreenHeight(30)),
  //                           Text('Ready to Pay by NFC'),
  //                           // Text('waiting for another device'),
  //                           ValueListenableBuilder<dynamic>(
  //                             valueListenable: result,
  //                             builder: (context, value, _) =>
  //                                 Text('${value ?? ''}'),
  //                           ),
  //                         ]))
  //                       : SizedBox(height: getProportionateScreenHeight(30)),
  //                 ],
  //               ))));
  // }

  // void _tagRead() async {
  //   // print('object');
  //   // bool avil = await NfcManager.instance.isAvailable();
  //   // print(avil);
  //   // NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
  //   //   result.value = tag.data;
  //   //   NfcManager.instance.stopSession();
  //   // });

  //   print("result.value");
  //   print(result.value);
  // }

  late StreamSubscription<NDEFMessage> _stream;

  void _startScanning() {
    setState(() {
      _stream = NFC
          .readNDEF(alertMessage: "Custom message with readNDEF#alertMessage")
          .listen((NDEFMessage message) {
        if (message.isEmpty) {
          print("Read empty NDEF message");
          return;
        }
        print("Read NDEF message with ${message.records.length} records");
        for (NDEFRecord record in message.records) {
          print(
              "Record '${record.id ?? "[NO ID]"}' with TNF '${record.tnf}', type '${record.type}', payload '${record.payload}' and data '${record.data}' and language code '${record.languageCode}'");
        }
      }, onError: (error) {
        setState(() {
          _stream.isPaused;
        });
        if (error is NFCUserCanceledSessionException) {
          print("user canceled");
        } else if (error is NFCSessionTimeoutException) {
          print("session timed out");
        } else {
          print("error: $error");
        }
      }, onDone: () {
        setState(() {
          _stream.cancel();
        });
      });
    });
  }

  void _stopScanning() {
    _stream.cancel();
    setState(() {
      _stream.cancel();
    });
  }

  // void _toggleScan() {
  //   if (_stream.cancel()) {
  //     _startScanning();
  //   } else {
  //     _stopScanning();
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _stopScanning();
  }

  late StreamSubscription<NDEFMessage> session;

  // late Stream<NDEFTag> sessionWriter;

  // late NDEFMessage message = NDEFMessage.withRecords("records",1);

  @override
  Widget build(BuildContext context) {
    var reading = false;
    var writing = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("NFC example"),
      ),
      body: Column(children: [
        TextButton(
            child: Text(reading ? "Stop reading" : "Start reading"),
            onPressed: () async {
              // NDEFMessage message = await NFC.readNDEF(once: true).first;
              // print("payload: ${message.payload}");
// once: true` only scans one tag!
              if (!reading) {
                setState(() {
                  reading = true;
                  session = NFC.readNDEF().listen((tag) {
                    print("TAG");
                    print(tag.data);
                  }, onError: (error) {
                    if (!(error is NFCUserCanceledSessionException)) {
                      // It is up to you how many exceptions you want to check for.
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Error!"),
                          content: Text(error.toString()),
                        ),
                      );
                    }
                  });
                });
              } else {
                session.cancel();
                setState(() {
                  reading = false;
                });
              }
            }),
        // TextButton(
        //     child: Text(writing ? "Stop writing" : "Start writing"),
        //     onPressed: () {
        //       if (!writing) {
        //         setState(() {
        //           writing = true;
        //           sessionWriter = NFC.writeNDEF("newMessage");
        //         });
        //       } else {
        //         sessionWriter.cancel();
        //         setState(() {
        //           writing = false;
        //         });
        //       }
        //     }), 6
      ]),
    );
  }
}
