import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/components/edit_image_args.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:path_provider/path_provider.dart';

class EditPhotoScreen extends StatefulWidget {
  static String routeName = "/edit_photo";
  // final File image;

  const EditPhotoScreen();

  @override
  _EditPhotoScreenState createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  final _cropController = CropController();

  @override
  void initState() {
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   final EditImageArguments args =
  //       ModalRoute.of(context)!.settings.arguments as EditImageArguments;
  //   Uint8List imageBytes = args.image.readAsBytesSync();

  //   return Crop(
  //       image: imageBytes,
  //       controller: _controller,
  //       onCropped: (image) {
  //         // do something with image data
  //       });
  // }

  var _isSumbnail = false;
  var _isCropping = false;
  var _isCircleUi = false;
  Uint8List? _croppedData;

  @override
  Widget build(BuildContext context) {
    final EditImageArguments args =
        ModalRoute.of(context)!.settings.arguments as EditImageArguments;
    Uint8List imageBytes = args.image.readAsBytesSync();
    return Scaffold(
      appBar: AppBar(
        title: Text("Crop Image"),
      ),
      body: Center(
        child: Visibility(
          visible: !_isCropping,
          child: Column(
            children: [
              Expanded(
                child: Visibility(
                    visible: _croppedData == null,
                    child: Stack(
                      children: [
                        Crop(
                          controller: _cropController,
                          image: imageBytes,
                          onCropped: (croppedData) {
                            setState(() {
                              _croppedData = croppedData;
                              _isCropping = false;
                            });
                          },
                          withCircleUi: _isCircleUi,
                          initialSize: 0.5,
                          maskColor: _isSumbnail ? Colors.white : null,
                          cornerDotBuilder: (size, index) => _isSumbnail
                              ? const SizedBox.shrink()
                              : const DotControl(),
                        ),
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: GestureDetector(
                            onTapDown: (_) =>
                                setState(() => _isSumbnail = true),
                            onTapUp: (_) => setState(() => _isSumbnail = false),
                            child: CircleAvatar(
                              backgroundColor: _isSumbnail
                                  ? Colors.blue.shade50
                                  : Colors.blue,
                              child: Center(
                                child: Icon(Icons.crop_free_rounded),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    replacement: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: _croppedData == null
                                ? SizedBox.shrink()
                                : Image.memory(_croppedData!),
                          ),
                          DefaultButton(
                              text: "Set Profile Picture",
                              press: () async {
                                if (_croppedData != null) {
                                  // final tempDir = await getTemporaryDirectory();
                                  final documentsDir =
                                      await getApplicationDocumentsDirectory();
                                  final dir = await new Directory(
                                          '${documentsDir.path}/profile_pic/')
                                      .create();
                                  final exists =
                                      await File('${dir.path}/user.png')
                                          .exists();

                                  if (exists) {
                                    File file = File('${dir.path}/user.png');
                                    await file.delete();
                                  }
                                  File file =
                                      await new File('${dir.path}/user.png')
                                          .create();

                                  await file.writeAsBytes(_croppedData!);
                                  imageCache!.evict(FileImage(file));

                                  Navigator.pushNamed(
                                      context, ProfileScreen.routeName);
                                }
                              })
                        ],
                      ),
                    )),
              ),
              if (_croppedData == null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.crop_7_5),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController.aspectRatio = 16 / 4;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.crop_16_9),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController.aspectRatio = 16 / 9;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.crop_5_4),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController.aspectRatio = 4 / 3;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.crop_square),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController
                                ..withCircleUi = false
                                ..aspectRatio = 1;
                            },
                          ),
                          IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                _isCircleUi = true;
                                _cropController.withCircleUi = true;
                              }),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isCropping = true;
                            });
                            _isCircleUi
                                ? _cropController.cropCircle()
                                : _cropController.crop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text('CROP IT!'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
            ],
          ),
          replacement: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
