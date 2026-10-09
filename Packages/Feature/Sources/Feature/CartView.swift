import SwiftUI

public struct CartView: View {
    @ObservedObject private var viewModel: CartViewModel

    public init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        List {
            ForEach(viewModel.lines, id: \.sku) { line in
                HStack {
                    Text(line.sku)
                    Spacer()
                    Text(line.price.formatted)
                }
            }
            if let total = viewModel.total {
                Text("Total: \(total.formatted)").bold()
            }
        }
        .onAppear { viewModel.load() }
    }
}
