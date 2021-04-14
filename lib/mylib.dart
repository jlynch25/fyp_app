import 'dart:async';

import 'package:flutter/services.dart';

class Mylib {
  static const MethodChannel _channel = const MethodChannel('mylib');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> blockchainStartNode(String walletAddres, String nodeID) async {
    final String? data = await _channel.invokeMethod('blockchainStartNode', [walletAddres, nodeID]);
    return data;
  }

  static Future<String?> blockchainReindexUTXO(String nodeID) async {
    final String? data = await _channel.invokeMethod('blockchainReindexUTXO', nodeID);
    return data;
  }

  static Future<String?> blockchainListAddresses(String nodeID) async {
    final String? data = await _channel.invokeMethod('blockchainListAddresses', nodeID);
    return data;
  }

  static Future<String?> blockchainCreateWallet(String nodeID) async {
    final String? data = await _channel.invokeMethod('blockchainCreateWallet', nodeID);
    return data;
  }

  static Future<String?> blockchainPrintChain(String nodeID) async {
    final String? data = await _channel.invokeMethod('blockchainPrintChain', nodeID);
    return data;
  }

  static Future<String?> blockchainCreateBlockChain(String walletAddres, String nodeID) async {
    final String? data = await _channel.invokeMethod('blockchainCreateBlockChain', [walletAddres, nodeID]);
    return data;
  }

  static Future<String?> blockchainGetBalance(String walletAddres, String nodeID) async {
    final String? data = await _channel.invokeMethod('blockchainGetBalance', [walletAddres, nodeID]);
    return data;
  }

  static Future<String> blockchainSend(String from, String to, int amount, String nodeID, bool mineNow) async {
    final data = await _channel.invokeMethod('blockchainSend', [from, to, amount, nodeID, mineNow]);
    return data.toString();
  }
} 
