import 'package:mylib_example/protos/service.pb.dart';

class SendArguments {
  final User recipient;
  final String address;

  SendArguments(this.recipient, this.address);
}
