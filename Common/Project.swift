import ProjectDescription


let project = Project(
  name: "Common",
  targets: [
    .target(
      name: "Common",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.cleanarchitecture.Common",
      sources: ["Sources/**"],
      dependencies: [
        // Third party
        .external(name: "RxSwift", condition: .none),
        .external(name: "RxCocoa", condition: .none),

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


