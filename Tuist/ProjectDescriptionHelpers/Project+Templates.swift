import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {

  // MARK: - Main App
  public static func framework(name: String,
                               dependencies: [TargetDependency]) -> Project {
    let target = makeFrameworkTarget(name: name, dependencies: dependencies)
    return Project(name: name, targets: [target])
  }

  // MARK: - Main target
  //  public static func app(name: String,
  //                         targets: [Target]) -> Project {
  //
  //  }

  // MARK: - Framework
  public static func makeFrameworkTarget(name: String,
                                         dependencies: [TargetDependency]) -> Target {
    Target.target(
      name: name,
      destinations: .iOS,
      product: .framework,
      bundleId: "com.hooligans.\(name)",
      sources: ["Sources/**"],
      dependencies: dependencies,
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    )
  }



  //  public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
  //    var targets = makeAppTargets(name: name,
  //                                 platform: platform,
  //                                 dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
  //    targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, platform: platform) })
  //    return Project(name: name,
  //                   organizationName: \(organizationName),
  //                   targets: targets)
  //  }


  // MARK: - Private

  /// Helper function to create a framework target and an associated unit test target
  //  private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
  //    let sources = Target(name: name,
  //                         platform: platform,
  //                         product: .framework,
  //                         bundleId: "com.\(projectName).\(name)",
  //                         infoPlist: .default,
  //                         sources: ["\(name)/Sources/**"],
  //                         resources: [],
  //                         dependencies: [])
  //    let tests = Target(name: "\(name)Tests",
  //                       platform: platform,
  //                       product: .unitTests,
  //                       bundleId: "com.\(projectName).\(name)Tests",
  //                       infoPlist: .default,
  //                       sources: ["Targets/\(name)/Tests/**"],
  //                       resources: [],
  //                       dependencies: [.target(name: name)])
  //    return [sources, tests]
  //  }
  //
  //  /// Helper function to create the application target and the unit test target.
  //  private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
  //    let platform: Platform = platform
  //    let infoPlist: [String: Plist.Value] = [
  //      "CFBundleShortVersionString": "1.0",
  //      "CFBundleVersion": "1",
  //      "UIMainStoryboardFile": "",
  //      "UILaunchStoryboardName": "LaunchScreen"
  //    ]
  //
  //    let mainTarget = Target(
  //      name: name,
  //      platform: platform,
  //      product: .app,
  //      bundleId: "com.\(projectName).\(name)",
  //      infoPlist: .extendingDefault(with: infoPlist),
  //      sources: ["\(name)/Sources/**"],
  //      resources: ["\(name)/Resources/**"],
  //      dependencies: dependencies
  //    )
  //
  //    let testTarget = Target(
  //      name: "\(name)Tests",
  //      platform: platform,
  //      product: .unitTests,
  //      bundleId: "com.\(projectName).\(name)Tests",
  //      infoPlist: .default,
  //      sources: ["\(name)/Tests/**"],
  //      dependencies: [
  //        .target(name: "\(name)")
  //      ])
  //    return [mainTarget, testTarget]
  //  }
  //}
}
