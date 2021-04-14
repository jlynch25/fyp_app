import 'package:flutter/material.dart';
import 'package:mylib_example/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none, fit: StackFit.expand,
        children: [
          CircleAvatar(
              // backgroundImage: AssetImage("assets/images/Profile Image.png"),
              ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                // TODO
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(50),
                //   side: BorderSide(color: Colors.black12),
                // ),
                // color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: Icon(
                  Icons.photo_camera,
                  size: getProportionateScreenWidth(18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
