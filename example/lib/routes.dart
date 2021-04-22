import 'package:flutter/widgets.dart';
import 'package:mylib_example/screens/friend_list/friend_list.dart';
import 'package:mylib_example/screens/home/home_screen.dart';
import 'package:mylib_example/screens/network/network_screen.dart';
import 'package:mylib_example/screens/profile/profile_screen.dart';
import 'package:mylib_example/screens/qr_maker.dart/qr_maker_screen.dart';
import 'package:mylib_example/screens/qr_scanner.dart/qr_scanner_screen.dart';
import 'package:mylib_example/screens/send.dart/send_screen.dart';
import 'package:mylib_example/screens/send_from_request/send_from_request_screen.dart';
import 'package:mylib_example/screens/send_select_address.dart/send_select_address_screen.dart';
import 'package:mylib_example/screens/sign_in/sign_in_screen.dart';
import 'package:mylib_example/screens/forgot_password/forgot_password_screen.dart';
import 'package:mylib_example/screens/sign_up/sign_up_screen.dart';
import 'package:mylib_example/screens/login_success/login_success_screen.dart';
import 'package:mylib_example/screens/complete_profile/complete_profile_screen.dart';
import 'package:mylib_example/screens/otp/otp_screen.dart';

import 'package:mylib_example/service/chat_service.dart';

final Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(ChatService()),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(ChatService()),
  CompleteProfileScreen.routeName: (context) =>
      CompleteProfileScreen(ChatService()),
  OtpScreen.routeName: (context) => OtpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(ChatService()),
  FriendListScreen.routeName: (context) => FriendListScreen(ChatService()),
  HomeScreen.routeName: (context) => HomeScreen(ChatService()),
  QrScannerScreen.routeName: (context) => QrScannerScreen(),
  QrMakerScreen.routeName: (context) => QrMakerScreen(),
  SendSelectAdressScreen.routeName: (context) =>
      SendSelectAdressScreen(ChatService()),
  SendScreen.routeName: (context) => SendScreen(),
  SendFromRequestScreen.routeName: (context) => SendFromRequestScreen(),
  NetworkScreen.routeName: (context) => NetworkScreen(ChatService()),
};
