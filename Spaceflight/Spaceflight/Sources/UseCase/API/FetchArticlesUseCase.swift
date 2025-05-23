import Foundation

public protocol FetchArticlesUseCase {
    func fetchArticles() async throws -> [Article]
}
