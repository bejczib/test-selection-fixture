import XCTest
@testable import FixtureApp

final class AppConfigTests: XCTestCase {
    func testCurrencyIsEuro() {
        XCTAssertEqual(AppConfig.currency, "EUR")
    }

    func testCartLimitIsPositive() {
        XCTAssertGreaterThan(AppConfig.maxCartItems, 0)
    }
}
