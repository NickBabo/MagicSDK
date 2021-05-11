import Foundation

public struct Card: Decodable {
    public var name: String
    public var legalities: [GameMode: Legality]
    public var set: String
}

public enum GameMode: String, Decodable {
    case duel
    case penny
    case modern
    case commander
    case legacy
}

public enum Legality: String, Decodable {
    case legal
    case notLegal = "not_legal"
    case banned
}
