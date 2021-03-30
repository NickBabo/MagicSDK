import Foundation
import NBNetwork

public final class MagicSDK {

    private let network: NBNetworkProtocol

    public init() {
        network = NBNetwork.shared.configure(baseURL: "https://api.scryfall.com")
    }

    internal init(network: NBNetworkProtocol) {
        self.network = network
    }

}

extension MagicSDK: MagicSDKProtocol {

    public func cards(
        parameters: [SearchParameter],
        completion: @escaping ((Result<CardResponse, NBAPIError>) -> Void)
    ) {
        network.request(
            CardService.cards(parameters),
            responseType: CardResponse.self,
            completion: completion
        )
    }
}
