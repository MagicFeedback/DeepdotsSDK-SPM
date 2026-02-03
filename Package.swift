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
            checksum: "3b7dbeeb94ba9cccf906ea567f3e5f9e2aa292aa815173605a13445a05159dbe"
        )
    ]
)
