import 'package:flutter/material.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/service/chat_service.dart';

import '../../../size_config.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  User user = ChatService.user;
  late Set<Future<String?>> balance;
  late int _totalbalance = 0;
  late bool _gotbalance = false;
  _BalanceCardState();

  @override
  void initState() {
    super.initState();
    balance = Set();

    for (Wallet wallet in user.wallets) {
      balance.add(Mylib.blockchainGetBalance(wallet.address, "3000"));
    }

    balanceState();
  }

  void balanceState() async {
    for (Future<String?> bal in balance) {
      _totalbalance = _totalbalance + int.parse((await bal)!);
    }
    setState(() => _gotbalance = true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO
        // Navigator.pushNamed(context, press);
      },
      child: SizedBox(
        width: getProportionateScreenWidth(330),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(150),
              width: getProportionateScreenWidth(330),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Total Balance",
                              style: TextStyle(fontSize: 20),
                              // textAlign: TextAlign.left
                            ),
                            Text(
                              "(accross all of your wallets)",
                              style: TextStyle(fontSize: 15),
                              // textAlign: TextAlign.left
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _gotbalance
                            ? Row(children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  _totalbalance.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Text(
                                  ".00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ])
                            : Row(children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                                CircularProgressIndicator(),
                              ]),
                      ),
                    ],
                  ),
                  // Icon(
                  //   icon,
                  //   size: 40,
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(text, textAlign: TextAlign.center)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
