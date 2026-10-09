import Core
import Networking
import Foundation

public final class CartViewModel: ObservableObject {
    @Published public private(set) var lines: [(sku: String, price: Money)] = []
    private let client: PriceSource

    public init(client: PriceSource) {
        self.client = client
    }

    /// Keeps the app target free of a direct Networking dependency.
    public static func demo() -> CartViewModel {
        CartViewModel(client: StaticPriceSource())
    }

    public func load() {
        let prices = (try? client.prices()) ?? [:]
        lines = prices.sorted { $0.key < $1.key }.map { (sku: $0.key, price: $0.value) }
    }

    public var total: Money? {
        guard let first = lines.first else { return nil }
        return lines.dropFirst().reduce(first.price) { $0 + $1.price }
    }
}
