import 'dart:async';
import 'dart:isolate';
import 'package:isolate_handler/isolate_handler.dart';

import 'package:flutter/material.dart';
import 'package:mylib/mylib.dart';
import 'package:mylib_example/routes.dart';
import 'package:mylib_example/service/chat_service.dart';
import 'package:mylib_example/theme.dart';
import 'package:mylib_example/screens/sign_in/sign_in_screen.dart';
import 'package:path_provider/path_provider.dart';

final isolates = IsolateHandler();
int counter = 0;

String pathMessage = '1EV5XRVZUz4XvX27QrUMZHnEiNmaUxYsRo';

void main() {
  // Workmanager.initialize(
  //   callbackDispatcher, // The top level function, aka callbackDispatcher
  //   isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  // );

  // WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
  // notmain();
  // loadIsolate();
  // WidgetsFlutterBinding.ensureInitialized();
  // startForegroundService();
}

// void notmain() {
//   // Start the isolate at the `entryPoint` function.
//   isolates.spawn<String?>(entryPoint,
//       name: "path",
//       // Executed every time data is received from the spawned isolate.
//       onReceive: setPath,
//       // Executed once when spawned isolate is ready for communication.
//       onInitialized: () =>
//           isolates.send("1EV5XRVZUz4XvX27QrUMZHnEiNmaUxYsRo", to: "path"));
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demode',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}

// void startForegroundService() async {
//   await FlutterForegroundPlugin.setServiceMethodInterval(seconds: 10);
//   await FlutterForegroundPlugin.setServiceMethod(globalForegroundService);
//   FlutterForegroundPlugin.startForegroundService(
//     holdWakeLock: false,
//     onStarted: () {
//       print("Foreground task on Started [BLCOCKCHAIN NETWORK]");
//     },
//     onStopped: () {
//       print("Foreground on Stopped");
//     },
//     title: "Flutter Foreground Service",
//     content: "This is Content",
//     iconName: "ic_stat_hot_tub",
//   );
// }

// void globalForegroundService() async {
//   debugPrint("current datetime is ${DateTime.now()}");
//   var user = ChatService.user;
//   String? blockchainResult = (await blockchainExists());
//   if ((blockchainResult == "true") && (user.wallets.isNotEmpty)) {
//     var output = await Mylib.blockchainStartNode(
//         // "1JQ8fK42bc6nzKQ2aEjtmVPdSd2QDVuPJP", //FIXME user.wallets[0].address,
//         user.wallets[0].address,
//         "3000",
//         // "[fe80::b1ab:613b:60d8:f447]:2000"
//         "[2a02:8084:a5bf:f680:1cfd:d24c:82aa:834]:1234"
//         // "[2a02:8084:a5bf:f680:8107:2b01:4867:4f23]:3000"
//         );
//     print("output: $output");
//   } else {
//     print("blockchain exists :- $blockchainResult");
//     print("user.wallets :- ${user.wallets}");
//   }
// }

// // Set new count and display current count.
// void setPath(String? path) {
//   // counter = count;
//   print("Counter is now $path");

//   // We will no longer be needing the isolate, let's dispose of it.
//   // isolates.kill("path");
// }

// // This function happens in the isolate.
// void entryPoint(Map<String, dynamic> context) async {
//   // Calling initialize from the entry point with the context is
//   // required if communication is desired. It returns a messenger which
//   // allows listening and sending information to the main isolate.
//   final messenger = HandledIsolate.initialize(context);

//   late String walletAddress;

//   // Triggered every time data is received from the main isolate.
//   messenger.listen((input) async {
//     // Use a plugin to get some new value to send back to the main isolate.
//     // final dir = await getApplicationDocumentsDirectory();
//     //
//     // Stream<dynamic> result = Mylib.blockchainStartNodeOLD(
//     //         walletAddress, "3000", "[fe80::b1ab:613b:60d8:f447]:9123")
//     //     .asStream();
//     //
//     //
//     messenger.send("starting");
//     walletAddress = input;

//     print("HERE NOW HASHASHHAS");
//   });

//   print("HERE NOW AHKLIUONWIJUNDCXOIJPIOMJopm");

//   var result = await Mylib.blockchainStartNodeOLD(
//       walletAddress, "3000", "[fe80::b1ab:613b:60d8:f447]:9123");
// }

//
// void entryPoint(Map<String, dynamic> context) {
//   final messenger = HandledIsolate.initialize(context);

//   // Triggered every time data is received from the main isolate.
//   messenger.listen((walletAddress) async {
//     var result = Mylib.blockchainStartNodeOLD(
//         walletAddress, "3000", "[fe80::b1ab:613b:60d8:f447]:9123");
//   });
// }

// OLD ISOLATE

// Future loadIsolate() async {
//   ReceivePort receivePort = ReceivePort();

//   await Isolate.spawn(isolateEntry, receivePort.sendPort);

//   SendPort sendPort = await receivePort.first;

//   String message = await sendRecieve(sendPort, "user.wallets[0].address");

//   // setState(() => output = message);
//   //
//   print("OUTPUT");
//   print(message);
// }

// isolateEntry(SendPort sendPort) async {
//   ReceivePort port = ReceivePort();

//   sendPort.send(port.sendPort);

//   await for (var msg in port) {
//     String data = msg[0];
//     SendPort replyPort = msg[1];

//     // http.Response response = await http.get(data);

//     String? result = await Mylib.blockchainStartNode(
//         data, "3000", "[fe80::b1ab:613b:60d8:f447]:9123");

//     replyPort.send([result]);
//   }
// }

// Future sendRecieve(SendPort send, message) {
//   ReceivePort responePort = ReceivePort();

//   send.send([message, responePort.sendPort]);
//   return responePort.first;
// }
