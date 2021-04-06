#import "FFmpegFlutterPlugin.h"
#if __has_include(<ffmpeg_flutter/ffmpeg_flutter-Swift.h>)
#import <ffmpeg_flutter/ffmpeg_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ffmpeg_flutter-Swift.h"
#endif

@implementation FFmpegFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFFmpegFlutterPlugin registerWithRegistrar:registrar];
}
@end
