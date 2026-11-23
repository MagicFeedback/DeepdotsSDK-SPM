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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.14/DeepdotsSDK-0.7.14.xcframework.zip",
            checksum: "e0818861d7c42b9f986a944460fb99f294af69b26e4b880a9444a082132e3ab7"
        )
    ]
)