// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "DeepdotsSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Expone el módulo que importará la app iOS
        .library(name: "ComposeApp", targets: ["ComposeApp"])
    ],
    targets: [
        // Binario SPM que apunta al XCFramework empaquetado
        .binaryTarget(
            name: "ComposeApp",
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.2/DeepdotsSDK-0.1.2.xcframework.zip",      // ej: https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.2/DeepdotsSDK-0.1.2.xcframework.zip
            checksum: "CHECKSUM"      // ej: salida de `swift package compute-checksum` sobre el zip
        )
    ]
)
