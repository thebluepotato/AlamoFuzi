// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "AlamoFuzi",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "AlamoFuzi",
            targets: ["AlamoFuzi"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0-beta.1"),
        .package(url: "https://github.com/thebluepotato/Fuzi", .branch("master"))
    ],
    targets: [
        .target(
            name: "AlamoFuzi",
            dependencies: ["Alamofire", "Fuzi"],
            path: "Sources",
            // Required for building Fuzi
            cSettings: [.headerSearchPath("$(SDKROOT)/usr/include/libxml2")]
        ),
        .testTarget(
            name: "AlamoFuziTests",
            dependencies: ["AlamoFuzi"],
            path: "Tests"
        )
    ]
)
