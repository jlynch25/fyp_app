import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mylib_example/components/send_from_request_args.dart';
import 'package:mylib_example/constants.dart';
import 'package:mylib_example/screens/send_from_request/send_from_request_screen.dart';
import 'package:mylib_example/size_config.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int codefound = 0;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          _buildQrView(context),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(23)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'Scan a QR code',
                    style: TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          new Positioned(
            top: 10.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0, //No shadow
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      var output = json.decode(scanData.code);

      codefound = codefound + 1;

      if (codefound == 1) {
        Navigator.pushNamed(context, SendFromRequestScreen.routeName,
            arguments: SendFromRequestArguments(
                output['amount']!, output['reciever']!, output['address']!));
        codefound = 0;
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
