import Foundation
import NBNetwork

public protocol MagicSDKProtocol {
    func cards(
        parameters: [SearchParameter],
        completion: @escaping ((Result<CardResponse, NBAPIError>) -> Void)
    )
}
