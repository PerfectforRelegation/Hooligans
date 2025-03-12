import DependencyPlugin
import ProjectDescription


// MARK: - Demo
public extension Target {
  static func demo(module: Module,
                   dependencies: [TargetDependency] = []) -> Target {
    let moduleName = module.targetName(type: .demo)
    return .target(
      name: moduleName,
      destinations: .iOS,
      product: .app,
      bundleId: "com.\(moduleName.lowercased()).demo",
      deploymentTargets: .iOS("14.0"),
      infoPlist: .extendingDefault(with: [
        "UILaunchStoryboardName": "LaunchScreen",
        "CFBundleVersion": "1.0",
      ]),
      sources: ["Demo/Sources/**"],
      resources: ["Demo/Resources/**"],
      dependencies: dependencies,
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    )
  }
}

// MARK: - Test
public extension Target {
  static func tests(module: Module,
                    dependencies: [TargetDependency] = []) -> Target {
    let moduleName = module.targetName(type: .tests)
    return .target(
      name: moduleName, destinations: .iOS,
      product: .unitTests,
      bundleId: "com.\(moduleName.lowercased()).tests",
      deploymentTargets: .iOS("14.0"),
      sources: ["Tests/**"],
      dependencies: dependencies + [.xctest],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    )
  }
}

// MARK: - Interface
public extension Target {
  static func interface(module: Module,
                        dependencies: [TargetDependency] = []) -> Target {
    let moduleName = module.targetName(type: .interface)
    return .target(
      name: moduleName,
      destinations: .iOS,
      product: .framework,
      bundleId: "com.\(moduleName.lowercased()).interface",
      deploymentTargets: .iOS("14.0"),
      sources: ["Interface/**"],
      dependencies: dependencies,
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    )
  }
}

// MARK: - Implement
public extension Target {
  static func implement(module: Module,
                        dependencies: [TargetDependency] = []) -> Target {
    let moduleName = module.targetName(type: .sources)
    return .target(
      name: moduleName,
      destinations: .iOS,
      product: .framework,
      bundleId: "com.\(moduleName.lowercased())",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      dependencies: dependencies,
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    )
  }

  static func implement(module: Module,
                        resources: ProjectDescription.ResourceFileElements,
                        dependencies: [TargetDependency] = []) -> Target {
    let moduleName = module.targetName(type: .sources)
    return .target(
      name: moduleName,
      destinations: .iOS,
      product: .framework,
      bundleId: "com.\(moduleName.lowercased())",
      deploymentTargets: .iOS("14.0"),
      sources: ["Sources/**"],
      resources: resources,
      dependencies: dependencies,
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    )
  }
}

// MARK: - Testing
public extension Target {
  static func testing(module: Module, dependencies: [TargetDependency] = []) -> Target {
    let moduleName = module.targetName(type: .testing)
    return .target(
      name: moduleName,
      destinations: .iOS,
      product: .framework,
      bundleId: "com.\(moduleName.lowercased()).testing",
      deploymentTargets: .iOS("14.0"),
      sources: ["Testing/**"],
      dependencies: dependencies,
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    )
  }
}

extension Target {
//  func makeTarget(name: String, product: Product, )
}
