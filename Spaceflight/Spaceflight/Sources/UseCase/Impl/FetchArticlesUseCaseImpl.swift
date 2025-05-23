import Foundation

final class FetchArticlesUseCaseImpl: FetchArticlesUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func fetchArticles() async throws -> [Article] {
        try await repository.fetchArticles()
    }
}

