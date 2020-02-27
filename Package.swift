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
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        .package(url: "https://github.com/cezheng/Fuzi", .revision("376905f17169b335ebed87f05bba55e77051d985"))//from: "3.1.2")
    ],
    targets: [
        .target(
            name: "AlamoFuzi",
            dependencies: ["Alamofire", "Fuzi"],
            path: "Sources" 
        ),
        .testTarget(
            name: "AlamoFuziTests",
            dependencies: ["AlamoFuzi"],
            path: "Tests"
        )
    ]
)
