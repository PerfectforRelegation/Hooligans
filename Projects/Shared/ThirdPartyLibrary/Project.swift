import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers


let project = Project(
  name: Module.Shared.thirdPartyLibrary.rawValue,
  targets: [
    .interface(
      module: .shared(.thirdPartyLibrary),
      dependencies: [
        .external(name: "RxSwift", condition: .none),
        .external(name: "RxCocoa", condition: .none),
        .external(name: "SnapKit", condition: .none),
      ]
    )
  ]
)
