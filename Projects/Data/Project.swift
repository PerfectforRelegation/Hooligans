import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers


let organizationName = "caveman"

let project = Project(
  name: Module.Data.database.rawValue,
  targets: [
    .interface(
      module: .data(.database),
      dependencies: [

      ]),
  ]
)


