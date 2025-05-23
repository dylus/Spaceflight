import Foundation

public protocol NetworkService {
    func fetchData<T: Decodable>(for url: String) async throws -> T
}

