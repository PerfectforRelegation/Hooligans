import ProjectDescription
import ProjectDescriptionHelpers


let appName = "Domain"

let project = Project.framework(
  name: appName,
  dependencies: [
    // Module
    .project(target: "Common",
             path: .relativeToRoot("Common/"),
             status: .required,
             condition: .none),
  ]
)
