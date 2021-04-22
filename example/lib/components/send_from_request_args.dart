import 'package:mylib_example/protos/service.pb.dart';

class SendFromRequestArguments {
  final String recipient;
  final String address;
  final String amount;

  SendFromRequestArguments(this.amount, this.recipient, this.address);
}
