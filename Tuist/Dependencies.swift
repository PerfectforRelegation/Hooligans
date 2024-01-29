
import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .exact("5.0.0"))
        ]
    ),
    platforms: [.iOS]
)
