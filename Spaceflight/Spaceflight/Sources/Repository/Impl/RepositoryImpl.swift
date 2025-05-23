import Foundation

final class RepositoryImpl: Repository {
    private let service: NetworkService
    private let config: ConfigProtocol
    
    init(service: NetworkService, config: ConfigProtocol) {
        self.service = service
        self.config = config
    }
    
    func fetchArticles() async throws -> [Article] {
        do {
            let articlesDTO: ArticlesDTO = try await service.fetchData(
                for: config.articlesURL
            )
            let articles = handleFetchData(articlesDTO: articlesDTO)
            return articles
        } catch {
            // TODO: Graceful Error Handling, Add new Error
            fatalError()
        }
    }
    
    private func handleFetchData(articlesDTO: ArticlesDTO) -> [Article] {
        guard let resultus = articlesDTO.results, resultus.isEmpty == false else {
            return []
        }
        
        let articles = resultus.map { articleDTO in
            Article(from: articleDTO)
        }
        
        return articles
    }
}

