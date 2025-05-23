import Foundation
import Testing
@testable import Spaceflight

//TODO: Add more tests like to cover throw (after adding Graceful Error Handling in RepositoryImpl)
struct FetchArticlesUseCaseImplTests {
    let subject: FetchArticlesUseCaseImpl
    let mockRepository: MockRepository
    
    init() {
        mockRepository = MockRepository()
        subject = FetchArticlesUseCaseImpl(repository: mockRepository)
    }
    
    @Test( "Given right data is returned, should return correct model")
    func fetchArticlesTest() async throws {
        let article = Article(title: "title",
                              imageURL: "url",
                              eventID: 1
        )
        mockRepository.dataToReturn = [article]
        
        let result = try await subject.fetchArticles()
        
        #expect(result.count == 1)
        #expect(mockRepository.fetchArticlesCallCount == 1)
    }
}
