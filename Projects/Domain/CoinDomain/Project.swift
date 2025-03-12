import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let moduleName = "CoinDomain"
let organizationName = "caveman"

let project = Project(
  name: "\(moduleName)",
  targets: [
    .target(
      name: "\(moduleName)Interface",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.domain.\(moduleName)Interface",
      deploymentTargets: .iOS("14.0"),
      sources: ["Interface/**"],
      dependencies: [
        .shared(target: .thirdPartyLibrary, type: .interface)
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),

    .target(
      name: moduleName,
      destinations: .iOS,
      product: .framework,
      bundleId: "com.domain.\(moduleName)",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      dependencies: [
        // Third party

        // Module
        .target(name: "\(moduleName)Interface", status: .required, condition: .none),
//        .project(target: "Common", path: .relativeToRoot("Projects/Common/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
    .testing(
      module: .domain(.coinDomain),
      dependencies: [
        .domain(target: .coinDomain, type: .interface)
    ])
  ]
)

