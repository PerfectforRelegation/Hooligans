import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers


let project = Project(
  name: Module.Shared.designSystem.rawValue,
  targets: [
    .implement(
      module: .shared(.designSystem),
      resources: ["Resources/**"],
      dependencies: [
        .shared(target: .thirdPartyLibrary, type: .interface)
    ]),

  ]
)


