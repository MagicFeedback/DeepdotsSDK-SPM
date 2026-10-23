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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.3/DeepdotsSDK-0.7.3.xcframework.zip",
            checksum: "6718f070892f9d6e179d26180439a82628b15185093bae43b9108e5f89c34a2a"
        )
    ]
)