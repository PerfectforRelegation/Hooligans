import Foundation


public struct Alarm: Codable {
  public let id: String
  public let content: String
  public let category: String
  public let time: Date
  public let isDelete: Bool

  public init(id: String, content: String, category: String, time: Date, isDelete: Bool) {
    self.id = id
    self.content = content
    self.category = category
    self.time = time
    self.isDelete = isDelete
  }
}
