import ProjectDescription
import ProjectDescriptionHelpers


let appName = "Presentation"

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
