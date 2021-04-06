//
//  FLTFFconfigPlugin.swift
//  ffmpeg_flutter
//
//  Created by nullptrX on 2021/4/6.
//

import Flutter
import UIKit

public class FLTFFconfigPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
    
    private var events: FlutterEventSink?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "nullptrx.github.io/ffconfig", binaryMessenger: registrar.messenger())
        let instance = FLTFFconfigPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)

        let eventChannel = FlutterEventChannel(name: "nullptrx.github.io/ffconfig_event", binaryMessenger: registrar.messenger())
        eventChannel.setStreamHandler(instance)
    }

    /// Uses `FlutterEventSink` to fire event.
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
//        examples:
//        events(true) // any generic type or more compex dictionary of [String:Any]
//        events(FlutterError(code: "ERROR_CODE",
//                            message: "Detailed message",
//                            details: nil)) // in case of errors
//        events(FlutterEndOfEventStream) // when stream is over
        self.events = events
        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.events = nil
        return nil
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }

}
