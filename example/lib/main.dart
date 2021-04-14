import 'package:flutter/material.dart';
import 'package:mylib_example/routes.dart';
import 'package:mylib_example/screens/home/home_screen.dart';
import 'package:mylib_example/theme.dart';
import 'package:mylib_example/screens/sign_in/sign_in_screen.dart';
// import 'package:mylib_example/screens/login_success/login_success_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
