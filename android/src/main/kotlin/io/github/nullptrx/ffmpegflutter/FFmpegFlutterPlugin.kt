package io.github.nullptrx.ffmpegflutter

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** FFmpegFlutterPlugin */
class FFmpegFlutterPlugin : FlutterPlugin {

  private val ffmpeg = FLTFFmpegPlugin()
  private val ffprobe = FLTFFprobePlugin()
  private val ffconfig = FLTFFconfigPlugin()

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    ffmpeg.onAttachedToEngine(binding)
    ffprobe.onAttachedToEngine(binding)
    ffconfig.onAttachedToEngine(binding)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    ffmpeg.onDetachedFromEngine(binding)
    ffprobe.onDetachedFromEngine(binding)
    ffconfig.onDetachedFromEngine(binding)
  }

}
