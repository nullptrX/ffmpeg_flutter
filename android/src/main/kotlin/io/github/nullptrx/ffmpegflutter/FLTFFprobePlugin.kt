package io.github.nullptrx.ffmpegflutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FLTFFprobePlugin : MethodChannel.MethodCallHandler {

  companion object {
    val kChannelName = "nullptrx.github.io/ffprobe"
  }

  private lateinit var methodChannel: MethodChannel

  fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel = MethodChannel(binding.binaryMessenger, kChannelName)
    methodChannel.setMethodCallHandler(this)
  }

  fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {


  }
}