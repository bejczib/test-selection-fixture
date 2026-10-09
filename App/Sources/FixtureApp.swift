import SwiftUI
import Feature

@main
struct FixtureApp: App {
    var body: some Scene {
        WindowGroup {
            CartView(viewModel: CartViewModel.demo())
        }
    }
}
