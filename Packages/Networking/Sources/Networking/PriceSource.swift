import Core
import Foundation

public struct PriceDTO: Decodable, Equatable {
    public let sku: String
    public let cents: Int
    public let currency: String
}

public protocol PriceSource {
    func prices() throws -> [String: Money]
}

public struct JSONPriceSource: PriceSource {
    private let data: Data

    public init(data: Data) {
        self.data = data
    }

    public func prices() throws -> [String: Money] {
        let dtos = try JSONDecoder().decode([PriceDTO].self, from: data)
        return Dictionary(uniqueKeysWithValues: dtos.map { ($0.sku, Money(cents: $0.cents, currency: $0.currency)) })
    }
}

public struct StaticPriceSource: PriceSource {
    public init() {}

    public func prices() throws -> [String: Money] {
        ["apple": Money(cents: 120, currency: "EUR"), "pear": Money(cents: 95, currency: "EUR")]
    }
}
