import 'package:ffmpeg_flutter/src/ffmpeg_plugin.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ffmpeg_flutter/ffmpeg_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('ffmpeg_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
    // expect(await ffmpeg.platformVersion, '42');
  // });
}
