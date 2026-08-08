primitive \nodoc\ _TestFormatter is LogFormatter
  fun apply(msg: String, loc: SourceLoc): String =>
    msg + "\n"
