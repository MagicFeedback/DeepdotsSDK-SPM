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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.8/DeepdotsSDK-0.7.8.xcframework.zip",
            checksum: "d6ea361044aa46d388e38deeef4b227ef75be13cb83ff9bfac52e90007428912"
        )
    ]
)