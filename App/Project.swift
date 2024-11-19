import ProjectDescription

// MARK: Constants
let projectName = "Hooligans"
let organizationName = "hooligans"
//let bundleID = "com.hooligans.Domain"
let targetVersion = "13.0"

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

// MARK: Struct
let project = Project(
  name: projectName,
  targets: [
    .target(
      name: projectName,
      destinations: .iOS,
      product: .app,
      bundleId: "com.\(organizationName).\(projectName)",
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        // Third party
        //        .external(name: "RxSwift", condition: .none),

        // Module
        .project(target: "Presentation", path: .relativeToRoot("Presentation/"), status: .required, condition: .none),
        .project(target: "Data", path: .relativeToRoot("Data/"), status: .required, condition: .none),
        .project(target: "Domain", path: .relativeToRoot("Domain/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),

    .target(
      name: "HooligansUnitTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "com.\(organizationName).HooligansTests",
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [
        .target(name: "Hooligans", status: .optional, condition: .none),
      ]
    ),

    .target(
      name: "HooligansUITests",
      destinations: .iOS,
      product: .uiTests,
      bundleId: "com.\(organizationName).HooligansUITests",
      infoPlist: .default,
      sources: ["UITests/**"],
      dependencies: [
        .target(name: "Hooligans", status: .optional, condition: .none),
      ]
    ),

  ]
)
