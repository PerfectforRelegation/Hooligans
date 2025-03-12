import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers


let project = Project(
  name: Module.Feature.baseFeature.rawValue,
  targets: [
    .implement(
      module: .feature(.baseFeature),
      dependencies: [
        .feature(target: .baseFeature, type: .interface),
        .shared(target: .designSystem),
        .shared(target: .thirdPartyLibrary, type: .interface),
      ]),
    .interface(
      module: .feature(.baseFeature),
      dependencies: [
        
      ]),
  ]
)


