# ByteBuffer

A basic fixed-size byte buffer.

## `ByteBuffer`

#### `ByteBuffer(_)`

Create a `ByteBuffer` with given length.

#### `buffer.length`

Return the length of the buffer, in bytes.

#### `buffer.description`

String representation of byte buffer's contents, for diagnostic purposes.

#### `buffer[ix]`

Read element `ix` from the buffer.

#### `buffer[ix] = foo`

Write element `ix` to the buffer.

#### `buffer.zero()`

Fill the buffer with zeroes.

#### `buffer.dataPointerInt8() -> UnsafeMutablePointer<Int8>`

Return an `Int8` pointer to the head of the buffer's data array. __You are responsible for ensuring that the buffer is not destroyed while the pointer is in use.__

#### `buffer.dataPointerUInt8() -> UnsafeMutablePointer<UInt8>`

Return a `UInt8` pointer to the head of the buffer's data array. __You are responsible for ensuring that the buffer is not destroyed while the pointer is in use.__

## `ByteBufferReader`

## `ByteBufferWriter`