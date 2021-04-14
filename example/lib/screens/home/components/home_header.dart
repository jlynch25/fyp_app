import 'package:flutter/material.dart';
import 'package:mylib_example/screens/home/components/user_search.dart';
// import 'package:mylib_example/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Home",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            width: 180,
          ),
          IconBtnWithCounter(
            svgSrc: Icons.search,
            press: () {
              showSearch(context: context, delegate: UserSearch());
            },
          ),
          IconBtnWithCounter(
            svgSrc: Icons.notifications,
            numOfitem: 4,
            press: () {},
          ),
        ],
      ),
    );
  }
}
