import 'dart:async';

import 'package:flutter/services.dart';

import 'log_level.dart';
import 'signal.dart';

final ffconfig = FFConfigPlugin._();

class FFConfigPlugin {
  /// The method channel used to interact with the native platform.
  static const MethodChannel _channel = const MethodChannel(
    'nullptrx.github.io/ffconfig',
  );

  /// The event channel used to receive log changes from the native platform.
  static const _eventChannel = const EventChannel(
    'nullptrx.github.io/ffconfig_event',
  );

  FFConfigPlugin._() {
    _channel.setMethodCallHandler((call) => _handleMethod(call));
    _eventChannel.receiveBroadcastStream().listen(
          _onEvent,
        );
  }

  final StreamController _streamController = StreamController.broadcast(
    sync: false,
  );

  Stream<T> on<T>() {
    if (T == dynamic) {
      return _streamController.stream as Stream<T>;
    } else {
      return _streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  /// Fires whenever the log changes.
  ///
  /// TODO Make dynamic reified
  Stream<dynamic> get onConsole {
    return on<dynamic>();
  }

  /// Fires whenever the statistics changes.
  ///
  /// TODO Make dynamic reified
  Stream<dynamic> get onStatistics {
    return on<dynamic>();
  }

  /// Interacts with the native platform
  ///
  Future<dynamic> _handleMethod(MethodCall call) async {
    // TODO Interact with the native platform
  }

  /// Fires whenever the log changes.
  ///
  void _onEvent(dynamic event) {
    // TODO Handle event from the native platform
    _streamController.add(event);
  }

  /// Checks execution output later.
  ///
  /// Returns result code
  Future<int> getLastReturnCode() async {
    return await _channel.invokeMethod('getLastReturnCode');
  }

  /// Prints last execution output.
  ///
  Future<void> printLastCommandOutput() async {
    await _channel.invokeMethod('printLastCommandOutput');
  }

  /// Ignores the handling of a signal.
  ///
  /// [signal] see [Signal]
  Future<void> ignoreSignal({required int signal}) async {
    await _channel.invokeMethod('ignoreSignal', signal);
  }

  /// Sets default log level.
  ///
  /// [level] see [LogLevel]
  Future<void> setLogLevel({required int level}) async {
    await _channel.invokeMethod('setLogLevel', level);
  }

  /// Registers custom fonts directory.
  ///
  /// [folder] folder with fonts
  Future<void> setFontDirectory({required String folder}) async {
    await _channel.invokeMethod('setFontDirectory', folder);
  }
}
