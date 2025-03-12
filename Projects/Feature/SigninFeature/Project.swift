import ProjectDescription


let projectName = "SigninFeature"

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
      name: "\(projectName)Example",
      destinations: .iOS,
      product: .app,
      bundleId: "com.\(projectName).example",
      deploymentTargets: .iOS("14.0"),
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Example/Sources/**"],
      resources: ["Example/Resources/**"],
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
        bundleId: "com.\(projectName).tests",
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
        bundleId: "com.\(projectName)",
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
        bundleId: "com.\(projectName).testing",
        deploymentTargets: .iOS("14.0"),
        sources: ["Testing/Sources/**"],
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
        bundleId: "com.\(projectName).interface",
        deploymentTargets: .iOS("14.0"),
        sources: ["Interface/Sources/**"],
        dependencies: [

        ],
        settings: .settings(configurations: [
          .debug(name: "Debug"),
          .release(name: "Release"),
        ])
      ),
  ]
)


