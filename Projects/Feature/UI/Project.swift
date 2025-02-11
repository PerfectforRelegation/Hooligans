import ProjectDescription


let projectName = "UIs"

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
      bundleId: "com.uis.example",
      deploymentTargets: .iOS("14.0"),
      infoPlist: .extendingDefault(with: infoPlist),
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
        name: projectName,
        destinations: .iOS,
        product: .framework,
        bundleId: "com.uis",
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
        bundleId: "com.uis.interface",
        deploymentTargets: .iOS("14.0"),
        sources: ["Interface/Sources/**"],
        dependencies: [
          .project(target: "Domain", path: .relativeToRoot("Projects/Domain/"), status: .required, condition: .none),
        ],
        settings: .settings(configurations: [
          .debug(name: "Debug"),
          .release(name: "Release"),
        ])
      ),

  ]
)


