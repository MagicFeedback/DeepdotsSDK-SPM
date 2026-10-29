// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "DeepdotsSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "ComposeApp", targets: ["ComposeApp"]) // módulo consumido desde Swift
    ],
    targets: [
        .binaryTarget(
            name: "ComposeApp",
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.5/DeepdotsSDK-0.7.5.xcframework.zip",
            checksum: "d2dd7cda4bd76313cc5a18561caf174d470ee2cb9f08d18b73299e54af71045b"
        )
    ]
)