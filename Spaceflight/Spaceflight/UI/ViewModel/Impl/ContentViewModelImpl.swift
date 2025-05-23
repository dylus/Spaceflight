import Foundation

final class ContentViewModelImpl: ContentViewModel {
    let fetchArticlesUseCase: FetchArticlesUseCase
    
    @Published
    var articels: [Article] = []
    
    init(fetchArticlesUseCase: FetchArticlesUseCase) {
        self.fetchArticlesUseCase = fetchArticlesUseCase
    }
    
    @MainActor
    func fetchArticles() async throws {
        articels = try await fetchArticlesUseCase.fetchArticles()
    }
}
