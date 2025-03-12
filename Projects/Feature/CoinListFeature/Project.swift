import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers


let project = Project(
  name: Module.Feature.coinListFeature.rawValue,
  targets: [
    .demo(
      module: .feature(.coinListFeature),
      dependencies: [
        .feature(target: .coinListFeature),
        .domain(target: .coinDomain, type: .testing),
      ]),
    .tests(
      module: .feature(.coinListFeature),
      dependencies: [
        .feature(target: .coinListFeature),
        .feature(target: .coinListFeature, type: .testing),
      ]),
    .implement(
      module: .feature(.coinListFeature),
      dependencies: [
        .feature(target: .baseFeature),
        .feature(target: .coinListFeature, type: .interface),
        .domain(target: .coinDomain, type: .interface),
      ]),
    .testing(
      module: .feature(.coinListFeature),
      dependencies: [
        .feature(target: .coinListFeature, type: .interface)
      ]),
    .interface(
      module: .feature(.coinListFeature),
      dependencies: [

      ]),
  ]
)


