import Foundation
import NBNetwork

protocol QueryValue {
    var value: String { get }
}

protocol QueryParameter {
    var query: String { get }
}

public enum CardColor: QueryValue {
    case white
    case black
    case red
    case blue
    case green
    case colorless

    var value: String {
        switch self {
        case .white: return "w"
        case .black: return "b"
        case .red: return "r"
        case .blue: return "u"
        case .green: return "g"
        case .colorless: return "c"
        }
    }

}

public enum CardColorRule {
    case exactly
    case including

}

public enum SearchParameter: QueryParameter {

    case name(String)
    case color(CardColorRule, [CardColor])
    case identity(CardColor)
    case type(String)

    var query: String {
        switch self {
        case .name(let term):
            return term
        case .color(let rule, let colors):
            return "c:\(colors.map { $0.value })"
        case .identity(let identity):
            return "id:\(identity.value)"
        case let .type(type):
            return "t:\(type)"
        }
    }

}

public enum CardService {
    case cards([SearchParameter])
}

extension CardService: NBServiceProtocol {
    
    public var path: String {
        switch self {
        case .cards: return "/cards/search"
        }
    }

    public var method: NBHTTPMethod {
        return .get
    }

    public var parameters: Encodable? {
        nil
    }

    public var headers: [String : String]? {
        nil
    }

    public var queryParameters: [String : String]? {
        switch self {
        case .cards(let parameters):
            return ["q": createQuery(from: parameters)]
        }
    }

    public var needsToken: Bool {
        false
    }

}

extension CardService {

    internal func createQuery(
        from parameters: [SearchParameter]
    ) -> String {
        var query: String = String()
        
        parameters.forEach { parameter in
            query.append(parameter.query)
            query.append("+")
        }
        query.removeLast()

        return query
    }
}
