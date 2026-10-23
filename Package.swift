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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.2/DeepdotsSDK-0.7.2.xcframework.zip",
            checksum: "1f7817fff13643f5956e686cab3601dff888ece8090fbcc1a56deedf0675a09c"
        )
    ]
)