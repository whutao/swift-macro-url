// swift-tools-version: 5.9
import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "swift-macro-url",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v10_15),
        .macCatalyst(.v13)
    ],
    products: [
        .library(name: "MacroURL", targets: ["MacroURL"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-syntax",
            from: Version(510, 0, 1)
        )
    ],
    targets: [
        .macro(name: "Macro", dependencies: [
            .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            .product(name: "SwiftSyntaxMacros", package: "swift-syntax")
        ]),
        .target(name: "MacroURL", dependencies: [
            .target(name: "Macro")
        ]),
        .testTarget(name: "MacroURLTests", dependencies: [
            .target(name: "Macro"),
            .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax")
        ])
    ]
)
