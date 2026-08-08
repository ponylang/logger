use "pony_test"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None

  fun tag tests(test: PonyTest) =>
    // Tests below function across all systems and are listed alphabetically
    test(_TestError)
    test(_TestFine)
    test(_TestInfo)
    test(_TestObjectLogging)
    test(_TestWarn)

class \nodoc\ iso _TestError is _StringLoggerTest
  fun name(): String => "logger/error"

  fun level(): LogLevel => Error

  fun tag expected(): String =>
    "error message\n"

  fun log(logger: Logger[String]) =>
    logger(Error) and logger.log("error message")
    logger(Warn) and logger.log("warn message")
    logger(Info) and logger.log("info message")
    logger(Fine) and logger.log("fine message")

class \nodoc\ iso _TestWarn is _StringLoggerTest
  fun name(): String => "logger/warn"

  fun level(): LogLevel => Warn

  fun tag expected(): String =>
    "error message\nwarn message\n"

  fun log(logger: Logger[String]) =>
    logger(Error) and logger.log("error message")
    logger(Warn) and logger.log("warn message")
    logger(Info) and logger.log("info message")
    logger(Fine) and logger.log("fine message")

class \nodoc\ iso _TestInfo is _StringLoggerTest
  fun name(): String => "logger/info"

  fun level(): LogLevel => Info

  fun tag expected(): String =>
    "error message\nwarn message\ninfo message\n"

  fun log(logger: Logger[String]) =>
    logger(Error) and logger.log("error message")
    logger(Warn) and logger.log("warn message")
    logger(Info) and logger.log("info message")
    logger(Fine) and logger.log("fine message")

class \nodoc\ iso _TestFine is _StringLoggerTest
  fun name(): String => "logger/fine"

  fun level(): LogLevel => Fine

  fun tag expected(): String =>
    "error message\nwarn message\ninfo message\nfine message\n"

  fun log(logger: Logger[String]) =>
    logger(Error) and logger.log("error message")
    logger(Warn) and logger.log("warn message")
    logger(Info) and logger.log("info message")
    logger(Fine) and logger.log("fine message")

class \nodoc\ _TestObjectLogging is _LoggerTest[U64]
  fun name(): String => "logger/object"

  fun logger(
    level': LogLevel,
    stream': OutStream,
    formatter': LogFormatter)
    : Logger[U64]
  =>
    Logger[U64](
      level',
      stream',
      {(a: U64): String => a.string() },
      formatter')

  fun level(): LogLevel => Fine

  fun tag expected(): String => "42\n"

  fun log(logger': Logger[U64]) =>
    logger'(Error) and logger'.log(U64(42))
