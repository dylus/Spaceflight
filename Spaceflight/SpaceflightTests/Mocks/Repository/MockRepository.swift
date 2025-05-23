import Foundation
@testable import Spaceflight

final class MockRepository: Repository {
    var fetchArticlesCallCount = 0
    var dataToReturn: [Spaceflight.Article] = []
    var shouldThrowError: Bool = false
    var errorToThrow = NetworkError.invalidURL
    
    func fetchArticles() async throws -> [Spaceflight.Article] {
        fetchArticlesCallCount += 1
        if shouldThrowError {
            throw errorToThrow
        }
        return dataToReturn
    }
}

