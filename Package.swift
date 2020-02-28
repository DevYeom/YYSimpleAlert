// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "YYSimpleAlert",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "YYSimpleAlert",
                 targets: ["YYSimpleAlert"])
    ],
    targets: [
        .target(name: "YYSimpleAlert",
                path: "YYSimpleAlert/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
