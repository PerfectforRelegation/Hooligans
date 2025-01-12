import ProjectDescription


let organizationName = "caveman"

let project = Project(
  name: "Presentation",
  targets: [
    .target(
      name: "Presentation",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.\(organizationName).Presentation",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        // Third party
//        .external(name: "RxSwift", condition: .none),

        // Module
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
  ]
  ,resourceSynthesizers: [
    .assets(),
    .strings(),
  ]
)
