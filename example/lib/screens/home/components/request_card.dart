import 'package:flutter/material.dart';

import '../../../size_config.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    Key? key,
    required this.icon1,
    required this.icon2,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon1;
  final IconData icon2;
  final String press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, press);
      },
      child: SizedBox(
        width: getProportionateScreenWidth(330),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                height: getProportionateScreenWidth(80),
                width: getProportionateScreenWidth(330),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      icon1,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      icon2,
                      size: 30,
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
