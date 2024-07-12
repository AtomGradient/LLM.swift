// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LLMllama",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .visionOS(.v1),
        .watchOS(.v4),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "LLMllama",
            targets: ["LLMllama"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ggerganov/llama.cpp/", branch: "master"),
        .package(url: "https://github.com/kishikawakatsumi/swift-power-assert", from: "0.12.0"),
    ],
    targets: [
        .target(
            name: "LLMllama",
            dependencies: [
                .product(name: "llama", package: "llama.cpp")
            ]),
        .testTarget(
            name: "LLMllamaTests",
            dependencies: [
                .product(name: "PowerAssert", package: "swift-power-assert"),
                "LLMllama"
            ]),
    ]
)
