import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SendCard extends StatelessWidget {
  const SendCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final String press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, press);
      },
      child: SizedBox(
        width: getProportionateScreenWidth(120),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(80),
              width: getProportionateScreenWidth(80),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
