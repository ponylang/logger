use "pony_test"
use "promises"

actor \nodoc\ _TestStream is OutStream
  let _output: String ref = String
  let _h: TestHelper
  let _promise: Promise[String]

  new create(h: TestHelper, promise: Promise[String]) =>
    _h = h
    _promise = promise

  be print(data: ByteSeq) =>
    _collect(data)

  be write(data: ByteSeq) =>
    _collect(data)

  be printv(data: ByteSeqIter) =>
    for bytes in data.values() do
      _collect(bytes)
    end

  be writev(data: ByteSeqIter) =>
    for bytes in data.values() do
      _collect(bytes)
    end

  be flush() => None

  fun ref _collect(data: ByteSeq) =>
    _output.append(data)

  be logged() =>
    let s: String = _output.clone()
    _promise(s)
