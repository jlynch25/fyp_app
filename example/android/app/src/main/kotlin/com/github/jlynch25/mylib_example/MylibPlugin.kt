package com.github.jlynch25.mylib

import android.os.Build
import android.os.Environment
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

import theBlockchain.TheBlockchain

/** MylibPlugin */
class MylibPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mylib")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${Build.VERSION.RELEASE}")
    }  else if (call.method == "blockchainStartNode") {
      val args = call.arguments
      if (args is List<*>) {
        val walletAddress = args[0].toString()
        val nodeID = args[1].toString()
        val localPath = args[2].toString()
        try {
//          result.success("This the PATH:  " +Environment.getExternalStorageDirectory().toString())
          result.success(TheBlockchain.startNode(nodeID, walletAddress, localPath))

        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else if (call.method == "blockchainReindexUTXO") {
      val args = call.arguments
      if (args is List<*>) {
        val nodeID = args[0].toString()
        val localPath = args[1].toString()
        try {
          result.success(TheBlockchain.reindexUTXO(nodeID, localPath))

        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else if (call.method == "blockchainListAddresses") {
      val args = call.arguments
      if (args is List<*>) {
        val nodeID = args[0].toString()
        val localPath = args[1].toString()
        try {
          result.success(TheBlockchain.listAddresses(nodeID, localPath))

        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else if (call.method == "blockchainCreateWallet") {
      val args = call.arguments
      if (args is List<*>) {
        val nodeID = args[0].toString()
        val localPath = args[1].toString()
        try {
//          result.success("This the PATH:  " +Environment.getExternalStorageDirectory().toString())
          result.success(TheBlockchain.createWallet(nodeID, localPath))

        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else if (call.method == "blockchainPrintChain") {
      val args = call.arguments
      if (args is List<*>) {
        val nodeID = args[0].toString()
        val localPath = args[1].toString()
        try {
          result.success(TheBlockchain.printChain(nodeID, localPath))

        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else if (call.method == "blockchainCreateBlockChain") {
      val args = call.arguments//.filterIsInstance<String>()
      if (args is List<*>) {
        val walletAddress = args[0].toString()
        val nodeID = args[1].toString()
        val localPath = args[2].toString()
        try {
          result.success(TheBlockchain.createBlockChain(walletAddress,nodeID,localPath))

        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else if (call.method == "blockchainGetBalance") {
      val args = call.arguments//.filterIsInstance<String>()
      if (args is List<*>) {
        val walletAddress = args[0].toString()
        val nodeID = args[1].toString()
        val localPath = args[2].toString()
        try {
          result.success(TheBlockchain.getBalance(walletAddress, nodeID, localPath))
        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else if (call.method == "blockchainSend") {
      val args = call.arguments
      if (args is List<*>) {
        val from = args[0].toString()
        val to = args[1].toString()
        val amount = args[2].toString().toLong()
        val nodeID = args[3].toString()
        val localPath = args[4].toString()
        val mineNow = args[5].toString().toBoolean()
        try {
          result.success(TheBlockchain.send(from, to, amount, nodeID, localPath, mineNow))

        } catch (e: IllegalArgumentException) {
          result.error("BAD_ARGS", e.message!!, null)
        } catch (e: Exception) {
          result.error("NATIVE_ERR", e.message!!, null)
        }
      }
      else {
        result.error("BAD_ARGS", "Wrong argument types", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
