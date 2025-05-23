import Foundation
import Testing
@testable import Spaceflight

struct NetworkServiceImplTests {
    let subject: NetworkServiceImpl
    let session: URLSession
    
    init() {
        URLProtocol.registerClass(MockURLProtocol.self)
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: configuration)
        
        subject = NetworkServiceImpl(urlSession: session)
    }

    @Test(
      "Given different URLs type, should throw correct",
      arguments: [""]
    )
    func fetchDataBadURLScenario(url: String) async {
        await #expect(
            throws: NetworkError.invalidURL,
            "An error should be thrown when URL is invalid",
            performing: { let _: ArticlesDTO = try await subject.fetchData(for: url) }
        )
    }
    
    @Test(
      "Given right data is returned, should return correct model"
    )
    func fetchDataRetuningModel() async throws {
        do {
            let articels: ArticlesDTO = try await subject.fetchData(for: "url")
            #expect(articels.results?.isEmpty == false )
        }
        catch {
            Issue.record("Shoudl always get mock data")
        }
    }
}



