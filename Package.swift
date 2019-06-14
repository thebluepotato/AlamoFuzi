// swift-tools-version:5.1

import PackageDescription
let package = Package(
    name: "AlamoFuzi",
    products: [
        .library(
            name: "AlamoFuzi",
            targets: ["AlamoFuzi"]),
    ],
    dependencies: [.package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0-beta.1"),
                   .package(url: "https://github.com/cezheng/Fuzi.git", from: "2.0.0")],
    targets: [
        .target(
            name: "AlamoFuzi", dependencies: ["Alamofire", "Fuzi"], path: "Sources"),
        .testTarget(name: "AlamoFuziTests", path: "Tests")
    ]
)
