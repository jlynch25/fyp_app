import 'package:flutter/material.dart';
import 'package:mylib_example/screens/home/components/user_search.dart';

import '../../../size_config.dart';

class SelectFriend extends StatelessWidget {
  const SelectFriend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                " \n\t\t\t\tSelect a Friend",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
