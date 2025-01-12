import ProjectDescription


let organizationName = "caveman"

let project = Project(
  name: "Data",
  targets: [
    .target(
      name: "Data",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.\(organizationName).Data",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      dependencies: [
        // Third party
//        .external(name: "RxSwift", condition: .none),

        // Module
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ]),
      coreDataModels: [
        .coreDataModel("Sources/CoreData/Model.xcdatamodeld"),
      ]
    ),
  ]
)


