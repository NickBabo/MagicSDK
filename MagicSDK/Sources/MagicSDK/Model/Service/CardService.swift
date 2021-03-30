import Foundation
import NBNetwork

public enum CardService {
    case cards
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
        return ["type": "leviathan"]
    }

    public var needsToken: Bool {
        false
    }

}
