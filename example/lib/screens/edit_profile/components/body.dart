import 'dart:io';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/components/default_button.dart';
import 'package:mylib_example/components/edit_image_args.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/screens/image_edit/image_edit_screen.dart';
import 'package:mylib_example/screens/profile/components/profile_menu.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
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
  User userOLD = ChatService.user;
  String updateResult = "false";
  User user = User();
  late String displayName;
  late String phoneNumber;

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
                    color: Colors.black.withOpacity(0.5), fontSize: 25),
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
                    color: Colors.black.withOpacity(0.5), fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              SizedBox(height: getProportionateScreenHeight(30)),
              buildDisplayNameFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPhoneNumberFormField(),
              SizedBox(height: getProportionateScreenHeight(40)),
              DefaultButton(
                  text: "continue",
                  press: () async {
                    if (user.phoneNumber.isNotEmpty || user.name.isNotEmpty) {
                      try {
                        await widget.service
                            .updateUser(user)
                            .then((val) => setState(() {
                                  updateResult = val!;
                                }));
                      } on GrpcError catch (err) {
                        _buildDialog(context, err.message!);
                      }

                      if (updateResult == "true") {
                        // if all are valid then go to success screen
                        final snackBar = SnackBar(
                          content: Text('Profile Data Updated'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      }
                    } else {
                      final snackBar = SnackBar(
                        content: Text('There is no data to change'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  })
            ]),
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        user.phoneNumber = value;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "${userOLD.phoneNumber}",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.phone,
          size: getProportionateScreenWidth(18),
        ), //CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildDisplayNameFormField() {
    return TextFormField(
      onChanged: (value) {
        user.name = value;
      },
      decoration: InputDecoration(
        labelText: "Your Name",
        hintText: "${userOLD.name}",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.person,
          size: getProportionateScreenWidth(18),
        ), //CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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
