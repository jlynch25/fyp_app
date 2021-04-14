import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:mylib_example/protos/service.pb.dart';
import 'package:mylib_example/protos/service.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ChatService {
  static User user = User();
  static ServiceClient client = client;
  // TODO - store bearerToken in the "SharedPreferences, in PRIVATE_MODE" or a ".so file" https://www.darwinrecruitment.com/blog/2016/06/store-credentials-securely-in-android
  static String bearerToken = "xyz";

  Future<void> makeClient() async {
    final cert = await rootBundle.loadString('./lib/assets/cert/public.crt');

    client = ServiceClient(
        ClientChannel(
          "140.203.204.105",
          port: 50051,
          options: ChannelOptions(
            credentials: ChannelCredentials.secure(
              certificates: utf8.encode(cert),
              // --- WORKAROUND FOR SELF-SIGNED DEVELOPMENT CA ---
              onBadCertificate: (certificate, host) =>
                  host == '140.203.204.105:50051',
            ),
          ),
        ),
        options: CallOptions(
            metadata: {'Authorization': 'Bearer $bearerToken'},
            timeout: Duration(seconds: 10)));
  }

  ChatService() {
    // user
    //   ..clearName()
    //   ..name = "Jack"
    //   ..email = "steve12345@gmail.com"
    //   ..password = "flutter";

    makeClient();
  }

  Future<String?> createUser(String email, password) async {
    try {
      user
        ..clear()
        ..email = email
        ..password = password;

      var result = await client.createUser(CreateUserReq(user: user)

          // Message()
          //   ..id = user.id
          //   ..content = body
          //   ..timestamp = DateTime.now().toIso8601String(),
          );
      if (result.hasUser() && result.hasAccessToken()) {
        user = result.user;
        bearerToken = result.accessToken;
        print(bearerToken);
      } else {
        return "server error";
      }
    } on GrpcError catch (err) {
      return err.message;
    }

    return "true";
  }

  Future<String?> loginUser(String email, password) async {
    try {
      var result = await client
          .loginUser(LoginUserReq(email: email, password: password));
      if (result.hasUser() && result.hasAccessToken()) {
        user = result.user;
        bearerToken = result.accessToken;
      } else {
        return "server error";
      }
    } on GrpcError catch (err) {
      return err.message;
      // TODO err.code handle
    }

    return "true";
  }

  Future<String?> updateUser(User user) async {
    try {
      var result = await client.updateUser(UpdateUserReq(user: user));
      if (result.hasUser()) {
        user = result.user;
        print(user);
      } else {
        return "server error";
      }
    } on GrpcError catch (err) {
      return err.message;
    }

    return "true";
  }

  Future<String?> addFriends(List<String> friends) async {
    try {
      var result = await client.addFriendUser(UpdateFriendUserReq(id: friends));
      if (!result.hasSuccess()) {
        return "server error";
      }
    } on GrpcError catch (err) {
      return err.message;
    }

    user.friends.addAll(friends);
    return "true";
  }

  Future<String?> removeFriends(List<String> friends) async {
    try {
      var result =
          await client.removeFriendUser(UpdateFriendUserReq(id: friends));
      if (!result.hasSuccess()) {
        return "server error";
      }
    } on GrpcError catch (err) {
      return err.message;
    }

    user.friends.remove(friends);
    return "true";
  }

  Stream<User> listFriends() async* {
    try {
      print(bearerToken);
      await for (var result in client
          .listFriendsUser(ListFriendsUserReq(accessToken: bearerToken))) {
        yield result.user;
      }
    } on GrpcError catch (err) {
      // TODO
    }
  }

  Future<List<User>> listXFriends(String number) async {
    var result;
    try {
      result =
          await client.listXFriendsUser(ListXFriendsUserReq(number: number));
    } on GrpcError catch (err) {
      // TODO
    }
    return result.friends;
  }

  Future<String?> addWallet(Wallet wallet) async {
    try {
      var result =
          await client.addWalletUser(UpdateWalletUserReq(wallet: wallet));
      if (!result.hasSuccess()) {
        return "server error";
      }
    } on GrpcError catch (err) {
      return err.message;
    }

    user.wallets.add(wallet);
    return "true";
  }

  Future<String?> removeWallet(Wallet wallet) async {
    try {
      var result =
          await client.removeWalletUser(UpdateWalletUserReq(wallet: wallet));
      if (!result.hasSuccess()) {
        return "server error";
      }
    } on GrpcError catch (err) {
      return err.message;
    }

    user.wallets.remove(wallet);
    return "true";
  }

  // Future<CreateUserRes> createUser(String name) async {
  //   var result = client.createUser(CreateUserReq(user: user
  //       // ..clearName()
  //       // ..name = name
  //       // ..email = "NOTMYEMAIL"
  //       // ..password = "flutter"
  //       ));

  //   return result;
  // }

  // Stream<Message> recieveMessage() async* {
  //   Connect connect = Connect()
  //     ..user = user
  //     ..active = true;

  //   await for (var msg in client.createStream(connect)) {
  //     yield msg;
  //   }
  // }
  //

}
