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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.3/DeepdotsSDK-0.1.3.xcframework.zip",
            checksum: "2ec37431bb5641d56a703ab594d945af280add095df18cba9cdfc8c3b30ff715"
        )
    ]
)
