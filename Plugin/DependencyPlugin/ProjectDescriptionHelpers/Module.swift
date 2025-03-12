import ProjectDescription


public enum Module {
  case feature(Feature)
  case domain(Domain)
  case data(Data)
  case core(Core)
  case shared(Shared)

  public func targetName(type: TargetType) -> String {
    switch self {
    case .feature(let feature):
      return feature.targetName(type: type)
    case .domain(let domain):
      return domain.targetName(type: type)
    case .data(let data):
      return data.targetName(type: type)
    case .core(let core):
      return core.targetName(type: type)
    case .shared(let shared):
      return shared.targetName(type: type)
    }
  }
}

public extension Module {
  enum Feature: String, TargetPathConvertable, CaseIterable {
    case baseFeature = "BaseFeature"
    case signinFeature = "SigninFeature"
    case coinListFeature = "CoinListFeature"
    case chartFeature = "ChartFeature"
    case orderBookFeature = "OrderBookFeature"
  }
}

public extension Module {
  enum Domain: String, TargetPathConvertable {
    case coinDomain = "CoinDomain"
  }
}

public extension Module {
  enum Data: String, TargetPathConvertable {
    case database = "Database"
  }
}

public extension Module {
  enum Core: String, TargetPathConvertable {
    case networking = "Newtworking"
  }
}

public extension Module {
  enum Shared: String, TargetPathConvertable {
    case designSystem = "DesignSystem"
    case thirdPartyLibrary = "ThirdPartyLibrary"
  }
}

public enum TargetType: String {
  case interface = "Interface"
  case sources = ""
  case testing = "Testing"
  case tests = "Tests"
  case demo = "Demo"
}

public protocol TargetPathConvertable {
  func targetName(type: TargetType) -> String
}

public extension TargetPathConvertable where Self: RawRepresentable {
  func targetName(type: TargetType) -> String {
    return "\(self.rawValue)\(type.rawValue)"
  }
}
