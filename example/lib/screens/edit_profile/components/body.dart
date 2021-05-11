import 'dart:io';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/components/edit_image_args.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/screens/image_edit/image_edit_screen.dart';
import 'package:mylib_example/screens/profile/components/profile_menu.dart';
// import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/size_config.dart';

import 'package:image_picker/image_picker.dart';

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

  late File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                "\t\t\t\tChange Profile Picture",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ProfileMenu(
            text: "Select From Gallery",
            icon: Icon(
              Icons.image,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              final pickedFile =
                  await picker.getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                _image = File(pickedFile.path);
                Navigator.pushNamed(context, EditPhotoScreen.routeName,
                    arguments: EditImageArguments(_image));
              }
            },
          ),
          ProfileMenu(
            text: "Take a photo",
            icon: Icon(
              Icons.camera_alt_outlined,
              size: getProportionateScreenWidth(18),
            ),
            press: () async {
              final pickedFile =
                  await picker.getImage(source: ImageSource.camera);
              if (pickedFile != null) {
                _image = File(pickedFile.path);
                Navigator.pushNamed(context, EditPhotoScreen.routeName,
                    arguments: EditImageArguments(_image));
              }
            },
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                "\n\t\t\t\tEdit Profile Details",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
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
            press: () {},
            // press: () => {_buildDialog(context, user.wallets.toString())},
          ),
        ],
      ),
    );
  }
}
