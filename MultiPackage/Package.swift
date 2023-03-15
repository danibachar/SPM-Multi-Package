// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

typealias Products = [[Product]]
typealias Dependencies = [[Package.Dependency]]
typealias Targets = [[Target]]

let package = Package(
    name: "MultiPackage",
    defaultLocalization: "en",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: Products([
        .MultiPackage1(),
        .MultiPackage2(),
    ]).flatMap { $0 },
    dependencies: Dependencies([
    ]).flatMap { $0 },
    targets: Targets([
        .MultiPackage1(),
        .MultiPackage2(),
    ]).flatMap { $0 }
)

// MARK: - MultiPackage1
extension Collection {
    static func MultiPackage1() -> [Target] where Element == Target {
        [
            .target(
                name: "MultiPackage1",
                dependencies: [
                ]),
            .testTarget(name: "MultiPackage1Tests",
                        dependencies: [
                            "MultiPackage1",
                        ]),
        ]
    }
    
    static func MultiPackage1() -> [Product] where Element == Product {
        [
            .library(
                name: "MultiPackage1",
                targets: ["MultiPackage1"]),
        ]
    }
}

// MARK: - MultiPackage2
extension Collection {
    static func MultiPackage2() -> [Target] where Element == Target {
        [
            .target(
                name: "MultiPackage2",
                dependencies: [
                    "MultiPackage1"
                ]),
            .testTarget(name: "MultiPackage2Tests",
                        dependencies: [
                            "MultiPackage2",
                        ]),
        ]
    }
    
    static func MultiPackage2() -> [Product] where Element == Product {
        [
            .library(
                name: "MultiPackage2",
                targets: ["MultiPackage2"]),
        ]
    }
}

// let package = Package(
//     name: "MultiPackage",
//     products: [
//         // Products define the executables and libraries a package produces, and make them visible to other packages.
//         .library(
//             name: "MultiPackage",
//             targets: ["MultiPackage"]),
//     ],
//     dependencies: [
//         // Dependencies declare other packages that this package depends on.
//         // .package(url: /* package url */, from: "1.0.0"),
//     ],
//     targets: [
//         // Targets are the basic building blocks of a package. A target can define a module or a test suite.
//         // Targets can depend on other targets in this package, and on products in packages this package depends on.
//         .target(
//             name: "MultiPackage",
//             dependencies: []),
//         .testTarget(
//             name: "MultiPackageTests",
//             dependencies: ["MultiPackage"]),
//     ]
// )
