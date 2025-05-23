import SwiftUI

@main
struct SpaceflightApp: App {
    var body: some Scene {
        WindowGroup {
            let service = NetworkServiceImpl(urlSession: URLSession.shared)
            let repository = RepositoryImpl(service: service, config: Config())
            let fetchArticlesUseCase = FetchArticlesUseCaseImpl(repository: repository)
            let viewModel = ContentViewModelImpl(fetchArticlesUseCase: fetchArticlesUseCase)
            ContentView(viewModel: viewModel)
        }
    }
}
