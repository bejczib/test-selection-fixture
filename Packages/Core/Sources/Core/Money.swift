import Foundation

public struct Money: Equatable, Hashable {
    public let cents: Int
    public let currency: String

    public init(cents: Int, currency: String) {
        self.cents = cents
        self.currency = currency
    }

    public static func + (lhs: Money, rhs: Money) -> Money {
        precondition(lhs.currency == rhs.currency, "currency mismatch")
        return Money(cents: lhs.cents + rhs.cents, currency: lhs.currency)
    }

    public var formatted: String {
        let whole = cents / 100
        let fraction = abs(cents % 100)
        return "\(whole).\(fraction < 10 ? "0" : "")\(fraction) \(currency)"
    }
}
