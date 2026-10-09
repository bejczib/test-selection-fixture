import XCTest
import Core
@testable import Networking

final class PriceSourceTests: XCTestCase {
    func testDecodesPrices() throws {
        let json = Data(#"[{"sku":"apple","cents":120,"currency":"EUR"}]"#.utf8)
        let prices = try JSONPriceSource(data: json).prices()
        XCTAssertEqual(prices["apple"], Money(cents: 120, currency: "EUR"))
    }

    func testStaticSourceHasTwoItems() throws {
        XCTAssertEqual(try StaticPriceSource().prices().count, 2)
    }
}
