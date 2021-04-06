import Flutter
import UIKit

public class SwiftFFmpegFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    FLTFFmpegPlugin.register(with: registrar)
    FLTFFprobePlugin.register(with: registrar)
    FLTFFconfigPlugin.register(with: registrar)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
