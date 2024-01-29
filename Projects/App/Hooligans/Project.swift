import ProjectDescription

// MARK: Constants
let projectName = "Hooligans"
let organizationName = "hooligans"
let bundleID = "com.hooligans.Hooligans"
let targetVersion = "14.0"

func setInfoPlist() -> [String: InfoPlist.Value] {
    return [
        "CFBundleShortVersionString": "1.0",
        "CFBundleVersion": "1",
        "UILaunchStoryboardName": "LaunchScreen",
        "NSAppTransportSecurity" : ["NSAllowsArbitraryLoads":true],
        "UISupportedInterfaceOrientations" : ["UIInterfaceOrientationPortrait"],
        "UIUserInterfaceStyle":"Light",
        "UIApplicationSceneManifest" : ["UIApplicationSupportsMultipleScenes":true,
                                        "UISceneConfigurations":[
                                            "UIWindowSceneSessionRoleApplication":[[
                                                "UISceneConfigurationName":"Default Configuration",
                                                "UISceneDelegateClassName":"$(PRODUCT_MODULE_NAME).SceneDelegate"
                                            ]]
                                        ]
                                       ]
    ]
}

// MARK: Struct
let project = Project(
  name: projectName,
  organizationName: organizationName,
  settings: .settings(configurations: [.debug(name: .debug), .release(name: .release)],
                      defaultSettings: .recommended),
  targets: [
    Target(name: "Hooligans",
           platform: .iOS,
           product: .app,
           bundleId: bundleID,
           deploymentTarget: .iOS(targetVersion: targetVersion, devices: [.iphone, .ipad]),
           infoPlist: .extendingDefault(with: setInfoPlist()),
           sources: ["Sources/**"],
           resources: ["Resources/**"],
           dependencies: defaultDependency()
          )
  ]
)

// Project 설정
private func baseSettings() -> Settings {
    var settings = SettingsDictionary()
    return Settings.settings(base: settings,
                             configurations: [
                                .debug(name:"Debug", xcconfig: .relativeToRoot("XCConfig/Hooligans-debug.xcconfig")),
                                .release(name:"Release", xcconfig: .relativeToRoot("XCConfig/Hooligans-release.xcconfig")),
                             ],
                             defaultSettings: .recommended(excluding: ["ASSETCATALOG_COMPILER_APPICON_NAME"]))
}

// Prod 타켓 설정
private func prodSettings() -> Settings {
    var settings = SettingsDictionary()
    return Settings.settings(base: settings,
                             configurations: [
                                .debug(name:"Debug", xcconfig: .relativeToRoot("XCConfig/App/PROD-debug.xcconfig")),
                                .release(name:"Release", xcconfig: .relativeToRoot("XCConfig/App/PROD-release.xcconfig")),
                             ],
                             defaultSettings: .recommended(excluding: ["ASSETCATALOG_COMPILER_APPICON_NAME"]))
}

private func defaultDependency() -> [TargetDependency] {
    return [
        .external(name: "SnapKit")
    ]
}

