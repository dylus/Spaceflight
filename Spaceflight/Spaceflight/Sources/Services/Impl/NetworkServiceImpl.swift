import Foundation

public enum NetworkError: Error, Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case let (.decodingFailed(lValue), .decodingFailed(rValue)):
            return lValue.localizedDescription == rValue.localizedDescription
        case let (.requestFailed(lValue), .requestFailed(rValue)):
            return lValue.localizedDescription == rValue.localizedDescription
        case (.invalidURL, .invalidURL):
            return true
        default:
            return false
        }
    }
    
    case invalidURL
    case requestFailed(Error)
    case decodingFailed(Error)
}

final class NetworkServiceImpl: NetworkService {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func fetchData<T: Decodable>(for url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await urlSession.data(for: urlRequest)
            
            try handleNetworkResponse(response)
            
            return try JSONDecoder().decode(T.self, from: data)
            
        }
        catch let error {
            throw error
        }
    }
    
    @discardableResult
    private func handleNetworkResponse(_ response: URLResponse) throws -> HTTPURLResponse {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.requestFailed(
                NSError(
                    domain: "Invalid response",
                    code: 1000,
                    userInfo: nil
                )
            )
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed(
                NSError(
                    domain: "Invalid response",
                    code: httpResponse.statusCode,
                    userInfo: nil
                )
            )
        }
        
        return httpResponse
    }
}

