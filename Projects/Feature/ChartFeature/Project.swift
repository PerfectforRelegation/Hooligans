import ProjectDescription

let projectName = "ChartFeature"
let infoPlist: [String: Plist.Value] = [
  "UILaunchStoryboardName": "LaunchScreen",
  "CFBundleVersion": "1.0",
  "UIApplicationSceneManifest": [
    "UIApplicationSupportsMultipleScenes": false,
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
  name: projectName,
  targets: [
    .target(
      name: "\(projectName)Demo",
      destinations: .iOS,
      product: .app,
      bundleId: "com.\(projectName.lowercased()).demo",
      deploymentTargets: .iOS("14.0"),
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Demo/Sources/**"],
      resources: ["Demo/Resources/**"],
      dependencies: [
        .target(name: projectName, status: .required, condition: .none),
        .target(name: "\(projectName)Testing", status: .required, condition: .none),

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
        bundleId: "com.\(projectName.lowercased()).tests",
        deploymentTargets: .iOS("14.0"),
        sources: ["Tests/**"],
        dependencies: [
          .target(name: projectName, status: .required, condition: .none),
          .target(name: "\(projectName)Testing", status: .required, condition: .none),
          .xctest
        ],
        settings: .settings(configurations: [
          .debug(name: "Debug"),
          .release(name: "Release"),
        ])
      ),

      .target(
        name: projectName,
        destinations: .iOS,
        product: .framework,
        bundleId: "com.\(projectName.lowercased())",
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
        name: "\(projectName)Testing",
        destinations: .iOS,
        product: .framework,
        bundleId: "com.\(projectName.lowercased()).testing",
        deploymentTargets: .iOS("14.0"),
        sources: ["Testing/**"],
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
        bundleId: "com.\(projectName.lowercased()).interface",
        deploymentTargets: .iOS("14.0"),
        sources: ["Interface/**"],
        dependencies: [
          .project(target: "CoinDomain", path: .relativeToRoot("Projects/Domain/CoinDomain/"), status: .required, condition: .none),
        ],
        settings: .settings(configurations: [
          .debug(name: "Debug"),
          .release(name: "Release"),
        ])
      ),
  ]
)


