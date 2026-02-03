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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.4/DeepdotsSDK-0.1.4.xcframework.zip",
            checksum: "67331389203dd46cb9196702892b69a37402ee4945d5431fa6a2f1fb5acc1d28"
        )
    ]
)
