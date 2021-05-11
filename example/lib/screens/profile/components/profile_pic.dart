import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mylib_example/size_config.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late Directory documentsDir;
  late bool image_exists;
  late FileImage user_image;

  @override
  void initState() {
    getDir();
  }

  void getDir() async {
    imageCache!.clear();
    final dir = await getApplicationDocumentsDirectory();
    final exists = await File("${dir.path}/profile_pic/user.png").exists();
    setState(() {
      documentsDir = dir;
      user_image = FileImage(File("${documentsDir.path}/profile_pic/user.png"));
      image_exists = exists;
    });
  }

  @override
  Widget build(BuildContext context) {
    // getDir();
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          image_exists
              ? CircleAvatar(
                  backgroundImage: user_image,
                  backgroundColor: Colors.blueGrey,
                )
              : CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                ),
          // Positioned(
          //   right: -16,
          //   bottom: 0,
          //   child: SizedBox(
          //     height: 46,
          //     width: 46,
          //     child: TextButton(
          //       // TODO
          //       // shape: RoundedRectangleBorder(
          //       //   borderRadius: BorderRadius.circular(50),
          //       //   side: BorderSide(color: Colors.black12),
          //       // ),
          //       // color: Color(0xFFF5F6F9),
          //       onPressed: () {},
          //       child: Icon(
          //         Icons.photo_camera,
          //         size: getProportionateScreenWidth(18),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
