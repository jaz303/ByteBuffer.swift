import PackageDescription

let package = Package(
	name: "ByteBuffer",
	targets: [],
	dependencies: [
		.Package(
			url: "https://github.com/jaz303/ByteBuffer.swift.git",
			majorVersion: 0
		)
	]
)