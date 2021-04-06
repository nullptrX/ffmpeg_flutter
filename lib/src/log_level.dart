/// Helper enumeration type for log levels.
class LogLevel {
  /// This log level is defined by MobileFFmpeg. It is used to specify logs
  /// printed to stderr by ffmpeg. Logs that has this level are not filtered and
  /// always redirected.
  ///
  /// @since 4.3.1
  static const int stderr = -16;

  /// Print no output.
  static const int quiet = -8;

  /// Something went really wrong and we will crash now.
  static const int panic = -0;

  /// Something went wrong and recovery is not possible.
  /// For example, no header was found for a format which depends
  /// on headers or an illegal combination of parameters is used.
  static const int fatal = 8;

  /// Something went wrong and cannot losslessly be recovered.
  /// However, not all future data is affected.
  static const int error = 16;

  /// Something somehow does not look correct. This may or may not
  /// lead to problems. An example would be the use of '-vstrict -2'.
  static const int warning = 24;

  /// Standard information.
  static const int info = 32;

  /// Detailed information.
  static const int verbose = 40;

  /// Stuff which is only useful for libav* developers.
  static const int debug = 48;

  /// Extremely verbose debugging, useful for libav* development.
  static const int trace = 56;
}
