package io.github.nullptrx.ffmpegflutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FLTFFconfigPlugin : MethodChannel.MethodCallHandler, EventChannel.StreamHandler {

  companion object {
    val kChannelName = "nullptrx.github.io/ffconfig"
    val kEventChannelName = "nullptrx.github.io/ffconfig_event"
  }

  private lateinit var methodChannel: MethodChannel
  private var events: EventChannel.EventSink? = null

  fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel = MethodChannel(binding.binaryMessenger, kChannelName)
    methodChannel.setMethodCallHandler(this)

    val eventChannel = EventChannel(binding.binaryMessenger, kEventChannelName)
    eventChannel.setStreamHandler(this)
  }

  fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel.setMethodCallHandler(null)
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    this.events = events
  }

  override fun onCancel(arguments: Any?) {
    this.events = null
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {


  }

}