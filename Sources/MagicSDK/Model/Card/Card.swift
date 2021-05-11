import Foundation

public struct Card: Decodable {
    public var name: String
    public var legalities: [GameMode: String]
    public var set: String
}

public enum GameMode: String, Decodable {
    case gladiator
    case duel
    case penny
    case pauper
    case modern
    case commander
    case legacy
    case vintage
    case oldschool
    case standard
    case brawl
    case premodern
    case future
    case historic
    case pioneer
}

public enum Legality: String, Decodable {
    case legal
    case notLegal = "not_legal"
    case banned
}
