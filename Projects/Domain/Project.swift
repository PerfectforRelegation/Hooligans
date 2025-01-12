import ProjectDescription


let organizationName = "caveman"

let project = Project(
  name: "Domain",
  targets: [
    .target(
      name: "Domain",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.\(organizationName).Domain",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      dependencies: [
        // Third party

        // Module
        .project(target: "Common", path: .relativeToRoot("Projects/Common/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
  ]
)

