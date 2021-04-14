// package com.github.jlynch25.mylib

// import android.os.Build
// import androidx.annotation.NonNull

// import io.flutter.embedding.engine.plugins.FlutterPlugin
// import io.flutter.plugin.common.MethodCall
// import io.flutter.plugin.common.MethodChannel
// import io.flutter.plugin.common.MethodChannel.MethodCallHandler
// import io.flutter.plugin.common.MethodChannel.Result
// import io.flutter.plugin.common.PluginRegistry.Registrar

// import theblockchain.TheBlockchain

// /** MylibPlugin */
// class MylibPlugin: FlutterPlugin, MethodCallHandler {
//   /// The MethodChannel that will the communication between Flutter and native Android
//   ///
//   /// This local reference serves to register the plugin with the Flutter Engine and unregister it
//   /// when the Flutter Engine is detached from the Activity
//   private lateinit var channel : MethodChannel

//   override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//     channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mylib")
//     channel.setMethodCallHandler(this)
//   }

//   override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
//     if (call.method == "getPlatformVersion") {
//       result.success("Android ${Build.VERSION.RELEASE}")
//     } else if (call.method == "blackchain") {
//       print("ENTERING BLOCKCHAIN")
//       val args = call.arguments
//       if (args is String) {
//         try {
//          result.success(TheBlockchain.main())
//         } catch (e: IllegalArgumentException) {
//           result.error("BAD_ARGS", e.message!!, null)
//         } catch (e: Exception) {
//           result.error("NATIVE_ERR", e.message!!, null)
//         }
//       }
//       else {
//         result.error("BAD_ARGS", "Wrong argument types", null)
//       }
//     } else {
//       result.notImplemented()
//     }
//   }

//   override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
//     channel.setMethodCallHandler(null)
//   }
// }
