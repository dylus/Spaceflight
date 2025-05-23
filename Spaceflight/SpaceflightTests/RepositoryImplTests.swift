import Foundation
import Testing
@testable import Spaceflight

struct RepositoryImplTests {
    let subject: RepositoryImpl
    let config: Config
    let mockNetworkService: MockNetworkService
    
    init() {
        config = Config()
        mockNetworkService = MockNetworkService()
        
        subject = RepositoryImpl(service: mockNetworkService, config: config)
    }
    
    //TODO: Add more test that can check different responses, maybe use arguments:
    @Test( "Given right data is returned, should return correct model" )
    func fetchArticlesTests() async throws {
        //TODO: Move creation of mock data to Helper or extension
        mockNetworkService.dataToReturn = ArticlesDTO(
            count: nil,
            next: nil,
            previous: nil,
            results: [
                ArticleDTO(
                    id: nil,
                    title: nil,
                    authors: nil,
                    url: nil,
                    imageURL: nil,
                    newsSite: nil,
                    summary: nil,
                    publishedAt: nil,
                    updatedAt: nil,
                    featured: nil,
                    launches: nil,
                    events: nil
                )
            ]
        )
        
        let articles: [Article] = try await subject.fetchArticles()
        
        #expect(mockNetworkService.fetchDataCallCount == 1)
        #expect(articles.isEmpty == false)
        #expect(articles.first?.title == "No title")
    }
}

