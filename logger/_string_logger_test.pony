trait \nodoc\ _StringLoggerTest is _LoggerTest[String]
  fun logger(
    level': LogLevel,
    stream': OutStream,
    formatter': LogFormatter)
    : Logger[String]
  =>
    StringLogger(level', stream', formatter')
