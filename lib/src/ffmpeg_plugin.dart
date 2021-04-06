import 'package:flutter/services.dart';

final ffmpeg = FFmpegPlugin._();

class FFmpegPlugin {
  static const _channel = const MethodChannel('nullptrx.github.io/ffmpeg');

  FFmpegPlugin._() {
    _channel.setMethodCallHandler((call) => _handleMethod(call));
  }

  _handleMethod(MethodCall call) {}

  /// Executes synchronous FFmpeg commands.
  ///
  /// [command] eg: -i file1.mp4 -c:v mpeg4 file2.mp4
  ///
  /// Returns result code
  Future<int> execute({required String command}) async {
    return await _channel.invokeMethod('execute', command);
  }

  /// Executes asynchronous FFmpeg commands.
  ///
  /// [command] eg: -i file1.mp4 -c:v mpeg4 file2.mp4
  ///
  /// Returns executionId for task
  Future<int> executeAsync({required String command}) async {
    return await _channel.invokeMethod('executeAsync', command);
  }

  /// Stops ongoing FFmpeg operations.
  ///
  /// [executionId] task id, stop a specific execution, if not null. Otherwise,
  /// stop all executions.
  Future<Null> cancel({String? executionId}) async {
    return await _channel.invokeMethod('cancel', executionId);
  }

  /// Records video using Android camera.
  ///
  /// [executionId] task id, stop a specific execution, if not null. Otherwise,
  /// stop all executions.
  Future<int> record({
    required String path,
    required Duration duration,
    double frameRate = 30,
    String pixelFormat = "bgr0",
  }) async {
    if (duration.inMilliseconds == 0) {
      return -1;
    }
    String time = duration.toString();
    String command = """-f android_camera 
        -i 0:0 -r $frameRate 
        -pixel_format $pixelFormat
        -t $time 
        $path
        """
        .trim();
    return await execute(command: command);
  }

  /// List ongoing executions.
  ///
  Future<dynamic> listExecutions() async {
    return await _channel.invokeMethod('listExecutions');
  }
}
