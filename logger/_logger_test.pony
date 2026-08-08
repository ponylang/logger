use "pony_test"
use "promises"

trait \nodoc\ _LoggerTest[A] is UnitTest
  fun apply(h: TestHelper) =>
    let promise = Promise[String]
    promise.next[None](recover this~_fulfill(h) end)

    let stream = _TestStream(h, promise)

    log(logger(level(), stream, _TestFormatter))

    stream.logged()
    h.long_test(2_000_000_000) // 2 second timeout

  fun tag _fulfill(h: TestHelper, value: String) =>
    h.assert_eq[String](value, expected())
    h.complete(true)

  fun timed_out(h: TestHelper) =>
    h.complete(false)

  fun logger(level': LogLevel,
    stream': OutStream,
    formatter': LogFormatter): Logger[A]

  fun level(): LogLevel

  fun tag expected(): String

  fun log(logger': Logger[A])
