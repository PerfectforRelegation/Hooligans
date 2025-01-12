import ProjectDescription


let project = Project(
  name: "Common",
  targets: [
    .target(
      name: "Common",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.caveman.Common",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      dependencies: [
        // Third party
        .external(name: "RxSwift", condition: .none),
        .external(name: "RxCocoa", condition: .none),
        .external(name: "SnapKit", condition: .none),

        // Module
//        .project(target: "Domain", path: .relativeToRoot("Domain/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
  ]
)


