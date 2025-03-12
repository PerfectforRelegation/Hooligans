import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers


let project = Project(
  name: Module.Feature.orderBookFeature.rawValue,
  targets: [
    .demo(
      module: .feature(.orderBookFeature),
      dependencies: [
        .feature(target: .orderBookFeature),
        .feature(target: .orderBookFeature, type: .testing),
      ]),
    .tests(
      module: .feature(.orderBookFeature),
      dependencies: [
        .feature(target: .orderBookFeature),
        .feature(target: .orderBookFeature, type: .testing),
      ]),
    .implement(
      module: .feature(.orderBookFeature),
      dependencies: [
        .feature(target: .orderBookFeature, type: .interface),
//        .domain(target: .coinDomain),
      ]),
    .testing(
      module: .feature(.orderBookFeature),
      dependencies: [
        .feature(target: .orderBookFeature, type: .interface)
      ]),
    .interface(
      module: .feature(.orderBookFeature),
      dependencies: [

      ]),
  ]
)


