// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Feature", targets: ["Feature"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Networking"),
    ],
    targets: [
        .target(
            name: "Feature",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "Networking", package: "Networking"),
            ]
        ),
        .testTarget(name: "FeatureTests", dependencies: ["Feature"]),
    ]
)
