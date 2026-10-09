import XCTest
@testable import Core

final class MoneyTests: XCTestCase {
    func testAddition() {
        let sum = Money(cents: 150, currency: "EUR") + Money(cents: 275, currency: "EUR")
        XCTAssertEqual(sum, Money(cents: 425, currency: "EUR"))
    }

    func testFormattingPadsCents() {
        XCTAssertEqual(Money(cents: 1005, currency: "EUR").formatted, "10.05 EUR")
    }
}
