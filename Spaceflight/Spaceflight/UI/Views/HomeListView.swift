import SwiftUI

struct ContentView<ViewModel: ContentViewModel>: View {
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Group {
            NavigationView {
                VStack {
                    List(viewModel.articels) { item in
                        ArticleListItemView(article: item)
                    }
                }
            }
        }.onAppear() {
            Task {
                try? await viewModel.fetchArticles()
            }
        }
    }
}
