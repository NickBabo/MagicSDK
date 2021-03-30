import Foundation

public protocol MagicSDKProtocol {
    public func cards(completion: ((Result<CardResponse, Error>) -> Void))
}
