import ProjectDescription


let projectName = "Coin"

let project = Project(
  name: projectName,
  targets: [
    .target(
      name: projectName,
      destinations: .iOS,
      product: .framework,
      bundleId: "com.coin",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      dependencies: [
        .target(name: "\(projectName)Interface", status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),

    .target(
      name: "\(projectName)Interface",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.coin.interface",
      deploymentTargets: .iOS("14.0"),
      sources: ["Interface/Sources/**"],
      dependencies: [
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),

    .target(
      name: "\(projectName)Example",
      destinations: .iOS,
      product: .app,
      bundleId: "com.coin.example",
      deploymentTargets: .iOS("14.0"),
      sources: ["Example/Sources/**"],
      resources: ["Example/Resources/**"],
      dependencies: [
        .target(name: projectName, status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),

    .target(
      name: "\(projectName)Tests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "com.coin.tests",
      deploymentTargets: .iOS("14.0"),
      sources: ["Tests/**"],
      dependencies: [
        .target(name: projectName, status: .required, condition: .none),
        .xctest
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
  ]
)


