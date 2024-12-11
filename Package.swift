// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
  productTypes: [
    "RxSwift": .framework,
    "RxCocoa": .framework,
    "RxCocoaRuntime": .framework,
    "RxRelay": .framework,
    "SnapKit": .framework,
  ]
)

#endif

let package = Package(
  name: "RxProject",
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
    .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.1"),
  ],
  targets: [
    .target(name: "RxProject", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
  ]
)
