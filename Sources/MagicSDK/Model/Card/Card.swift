import Foundation

public struct Card: Decodable {
    public var name: String
    public var legalities: [String: String]
    public var set: String
}
