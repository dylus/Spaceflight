import Foundation
import Testing
@testable import Spaceflight

struct ContentViewModelImplTests {
    let subject: ContentViewModelImpl
    let mockFetchArticlesUseCase: MockFetchArticlesUseCase
    
    init() {
        mockFetchArticlesUseCase = MockFetchArticlesUseCase()
        
        subject = ContentViewModelImpl(fetchArticlesUseCase: mockFetchArticlesUseCase)
    }
    
    //TODO: Add more test that can check different responses, maybe use arguments:
    @Test( "Given right data is returned, should return correct model" )
    func fetchArticlesTests() async throws {
        //TODO: Move creation of mock data to Helper or extension
        let article = Article(title: "title",
                              imageURL: "url",
                              eventID: 1)
        mockFetchArticlesUseCase.dataToReturn = [article]
        
        try await subject.fetchArticles()
        
        #expect(mockFetchArticlesUseCase.fetchArticlesCallCount == 1)
        #expect(subject.articels.isEmpty == false)
    }
}
