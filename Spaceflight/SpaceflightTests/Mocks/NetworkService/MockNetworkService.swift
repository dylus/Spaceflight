import Foundation
@testable import Spaceflight

final class MockNetworkService: NetworkService {
    var fetchDataCallCount = 0
    var dataToReturn: ArticlesDTO?
    var shouldThrowError: Bool = false
    var errorToThrow = NetworkError.invalidURL
    
    func fetchData<T: Decodable>(for url: String) async throws -> T {
        fetchDataCallCount += 1
        if shouldThrowError {
            throw errorToThrow
        }
        return dataToReturn as! T
    }
}

