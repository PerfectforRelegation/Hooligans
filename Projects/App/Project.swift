import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let appName = "Hooligans"
let organizationName = "caveman"

let infoPlist: [String: Plist.Value] = [
  "UILaunchStoryboardName": "LaunchScreen", // Launch screen configuration
  "CFBundleVersion": "1", // Prevent bundle version error
  "UIApplicationSceneManifest": [
    "UIApplicationSupportsMultipleScenes": true,
    "UISceneConfigurations": [
      "UIWindowSceneSessionRoleApplication": [
        [
          "UISceneClassName": "UIWindowScene",
          "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
        ]
      ]
    ]
  ]
]

let project = Project(
  name: appName,
  targets: [
    .target(
      name: appName,
      destinations: .iOS,
      product: .app,
      bundleId: "com.\(organizationName).\(appName)",
      deploymentTargets: .iOS("14.0"),
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: 
        Module.Feature.allCases.map { .feature(target: $0) }
      + [
        // Third party
        //        .external(name: "RxSwift", condition: .none),

        // Module
//        .project(target: "Presentation", path: .relativeToRoot("Projects/Presentation/"), status: .required, condition: .none),
//        .project(target: "Auth", path: .relativeToRoot("Projects/Feature/Auth/"), status: .required, condition: .none),
//        .project(target: "Data", path: .relativeToRoot("Projects/Data/"), status: .required, condition: .none),
//        .project(target: "Domain", path: .relativeToRoot("Projects/Domain/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),

    .target(
      name: "\(appName)UnitTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "com.\(organizationName).\(appName)UnitTests",
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [
        .target(name: appName, status: .optional, condition: .none),
      ]
    ),

    .target(
      name: "\(appName)UITests",
      destinations: .iOS,
      product: .uiTests,
      bundleId: "com.\(organizationName).\(appName)UITests",
      infoPlist: .default,
      sources: ["UITests/**"],
      dependencies: [
        .target(name: appName, status: .optional, condition: .none),
      ]
    ),

  ]
)
