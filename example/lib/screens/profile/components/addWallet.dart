import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
import 'package:mylib_example/service/chat_service.dart';

TextEditingController titleController = new TextEditingController();

class AddWallet extends StatefulWidget {
  final ChatService service;
  AddWallet(this.service);
  @override
  _AddWalletState createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  User user = ChatService.user;
  String updateResult = "false";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
      child: InkWell(
        child: Container(
          height: 180,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 1),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "New Wallet",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        onTap: () {
          _showDialog();
        },
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding:
            const EdgeInsets.fromLTRB(15, 30, 15, 0), //EdgeInsets.all(20.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                controller: titleController,
                decoration: new InputDecoration(
                  labelText: 'Wallet Title',
                  hintText: 'e.g. SAVINGS or PRIMARY',
                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new TextButton(
              child: const Text('CREATE'),
              onPressed: () async {
                try {
                  String newAddress =
                      (await Mylib.blockchainCreateWallet("3000"))!;

                  Wallet wallet = Wallet();
                  wallet.title = titleController.text;
                  wallet.address = newAddress;
                  await widget.service
                      .addWallet(wallet)
                      .then((val) => setState(() {
                            updateResult = val!;
                          }));
                } on GrpcError catch (err) {
                  // _buildDialog(context, err.message);
                  final snackBar = SnackBar(
                    content: Text(err.message!),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                if (updateResult == "true") {
                  final snackBar = SnackBar(
                    content: Text('Created a new Wallet'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {});
                } else {
                  // _buildDialog(context, updateResult);
                  final snackBar = SnackBar(
                    content: Text(updateResult),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                Navigator.pop(context);
                Navigator.pushNamed(context, ProfileScreen.routeName);
              })
        ],
      ),
    );
  }
}
