// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlertifySwift",
    platforms: [.iOS(.v13), .tvOS(.v13)],
//    , .macOS(.v10_15), .watchOS(.v6), .macCatalyst(.v13)
    products: [
        .library(name: "AlertifySwift", targets: ["AlertifySwift"]),
    ],
    targets: [
        .target(name: "AlertifySwift"),
    ]
)
