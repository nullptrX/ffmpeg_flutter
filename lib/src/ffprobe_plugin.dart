import 'package:flutter/services.dart';

final ffprobe = FFprobePlugin._();

class FFprobePlugin {
  static const _channel = const MethodChannel('nullptrx.github.io/ffprobe');

  FFprobePlugin._() {
    _channel.setMethodCallHandler((call) => _handleMethod(call));
  }

  _handleMethod(MethodCall call) {}

  /// Executes FFprobe commands.
  ///
  /// [command] eg: -i file1.mp4
  /// Returns result code
  Future<int> execute({required String command}) async {
    return await _channel.invokeMethod('execute', command);
  }

  /// Gets media information for a file.
  ///
  /// [path] file path or uri
  /// Return media information.
  Future<dynamic> getMediaInformation({required String path}) async {
    return await _channel.invokeMethod('getMediaInformation', path);
  }

}
