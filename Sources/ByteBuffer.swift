import Foundation

public class ByteBuffer : CustomStringConvertible {
	public init(_ length: Int) {
		self.length = length
		self.data = Array<UInt8>(count: length, repeatedValue: 0)
	}

	public var description: String {
		var out : String = "<ByteBuffer"
		for i in 0 ..< min(16, length) {
			out += " " + String(format:"%02X", data[i])
		}
		if length > 16 {
			out += " ..."
		}
		out += ">"
		return out
	}

	subscript(ix: Int) -> UInt8 {
		get { return data[ix] }
		set { data[ix] = newValue }
    }

	public func zero() {
		fill(0)
	}

	public func fill(value: UInt8) {
		fill(value, offset: 0, length: length)
	}

	public func fill(value: UInt8, offset: Int, length: Int) {
		for i in 0 ..< length {
			data[i] = value
		}
	}

	public func fill(value: UInt8, start: Int, end: Int) {
		for i in start ..< end {
			data[i] = value
		}
	}

	public func reader(offset offset: Int = 0) -> ByteBufferReader {
		return ByteBufferReader(buffer: self, offset: offset)
	}

	public func writer(offset offset: Int = 0) -> ByteBufferWriter {
		return ByteBufferWriter(buffer: self, offset: offset)
	}

	public func dataPointerInt8() -> UnsafeMutablePointer<Int8> {
		return cast(&data)
	}

	public func dataPointerUInt8() -> UnsafeMutablePointer<UInt8> {
		return cast(&data)
	}

	public let length: Int
	var data: Array<UInt8>
}

// I assume this is horribly illegal but it seems to work!
func cast<T>(inout ary: Array<UInt8>) -> UnsafeMutablePointer<T> {
	var ptr: COpaquePointer = nil
	ary.withUnsafeMutableBufferPointer { (tmp) in
	    ptr = COpaquePointer(tmp.baseAddress)
	}
	return UnsafeMutablePointer<T>(ptr)
}

public class ByteBufferReader {
	public init(buffer: ByteBuffer, offset: Int) {
		self.buffer = buffer
		self.pos = offset
	}

	public var remain: Int {
		return self.buffer.length - self.pos
	}

	public func read() -> UInt8 {
		let val = buffer.data[pos]
		pos += 1
		return val
	}

	public let buffer: ByteBuffer
	var pos: Int
}

public class ByteBufferWriter {
	public init(buffer: ByteBuffer, offset: Int) {
		self.buffer = buffer
		self.pos = offset
	}

	public var remain: Int {
		return self.buffer.length - self.pos
	}

	public func write(val: UInt8) {
		buffer.data[pos] = val
		pos += 1
	}
	
	public let buffer: ByteBuffer
	var pos: Int	
}
