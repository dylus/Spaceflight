import Foundation

public protocol Repository {
    func fetchArticles() async throws -> [Article]
}
