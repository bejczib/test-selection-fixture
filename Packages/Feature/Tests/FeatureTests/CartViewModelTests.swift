import XCTest
import Core
import Networking
@testable import Feature

final class CartViewModelTests: XCTestCase {
    func testTotalSumsAllLines() {
        let viewModel = CartViewModel(client: StaticPriceSource())
        viewModel.load()
        XCTAssertEqual(viewModel.total, Money(cents: 215, currency: "EUR"))
    }

    func testEmptyCartHasNoTotal() {
        struct Empty: PriceSource { func prices() throws -> [String: Money] { [:] } }
        let viewModel = CartViewModel(client: Empty())
        viewModel.load()
        XCTAssertNil(viewModel.total)
    }
}
