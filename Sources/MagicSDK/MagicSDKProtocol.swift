import Foundation
import NBNetwork

public protocol MagicSDKProtocol {
    func cards(completion: @escaping ((Result<CardResponse, NBAPIError>) -> Void))
}
