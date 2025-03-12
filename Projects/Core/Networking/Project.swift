import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers


let organizationName = "caveman"

let project = Project(
  name: Module.Core.networking.rawValue,
  targets: [
    .interface(
      module: .core(.networking),
      dependencies: [

      ]),
  ]
)
