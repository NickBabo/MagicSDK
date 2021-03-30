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
