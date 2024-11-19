import ProjectDescription
import ProjectDescriptionHelpers


let appName = "Data"

let project = Project.framework(
  name: appName,
  dependencies: [
    // Module
    .project(target: "Domain",
             path: .relativeToRoot("Domain/"),
             status: .required,
             condition: .none),
  ]
)
