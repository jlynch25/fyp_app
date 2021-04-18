import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Mylib {
  static const MethodChannel _channel = const MethodChannel('mylib');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  // static Future<String?> get localPath async {
  //   final String? directory =
  //       await _channel.invokeMethod('getApplicationDocumentsDirectory');
  //   return directory;
  // }

  static Future<String?> blockchainStartNode(
      String walletAddres, String nodeID) async {
    final localPath = await getApplicationDocumentsDirectory();
    final String? data = await _channel.invokeMethod(
        'blockchainStartNode', [walletAddres, nodeID, localPath.path]);
    return data;
  }

  static Future<String?> blockchainReindexUTXO(String nodeID) async {
    final localPath = await getApplicationDocumentsDirectory();
    final String? data = await _channel
        .invokeMethod('blockchainReindexUTXO', [nodeID, localPath.path]);
    return data;
  }

  static Future<String?> blockchainListAddresses(String nodeID) async {
    final localPath = await getApplicationDocumentsDirectory();
    final String? data = await _channel
        .invokeMethod('blockchainListAddresses', [nodeID, localPath.path]);
    return data;
  }

  static Future<String?> blockchainCreateWallet(String nodeID) async {
    final localPath = await getApplicationDocumentsDirectory();
    final String? data = await _channel
        .invokeMethod('blockchainCreateWallet', [nodeID, localPath.path]);
    return data;
  }

  static Future<String?> blockchainPrintChain(String nodeID) async {
    final localPath = await getApplicationDocumentsDirectory();
    final String? data = await _channel
        .invokeMethod('blockchainPrintChain', [nodeID, localPath.path]);
    return data;
  }

  static Future<String?> blockchainCreateBlockChain(
      String walletAddres, String nodeID) async {
    final localPath = await getApplicationDocumentsDirectory();
    final String? data = await _channel.invokeMethod(
        'blockchainCreateBlockChain', [walletAddres, nodeID, localPath.path]);
    return data;
  }

  static Future<String?> blockchainGetBalance(
      String walletAddres, String nodeID) async {
    final localPath = await getApplicationDocumentsDirectory();
    final String? data = await _channel.invokeMethod(
        'blockchainGetBalance', [walletAddres, nodeID, localPath.path]);
    return data;
  }

  static Future<String> blockchainSend(
      String from, String to, int amount, String nodeID, bool mineNow) async {
    final localPath = await getApplicationDocumentsDirectory();
    final data = await _channel.invokeMethod(
        'blockchainSend', [from, to, amount, nodeID, localPath.path, mineNow]);
    return data.toString();
  }
}
