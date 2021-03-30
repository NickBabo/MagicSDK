import Foundation

public protocol MagicSDKProtocol {
    func cards(completion: ((Result<CardResponse, Error>) -> Void))
}
