//
//  FLTFFprobePlugin.swift
//  ffmpeg_flutter
//
//  Created by nullptrX on 2021/4/6.
//

import Flutter
import UIKit

public class FLTFFprobePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "nullptrx.github.io/ffprobe", binaryMessenger: registrar.messenger())
    let instance = FLTFFprobePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
