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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.4/DeepdotsSDK-0.7.4.xcframework.zip",
            checksum: "22be979493b9c0cc37c03b86e32e745fb02b4cd772c9bf2f959224c810272e07"
        )
    ]
)