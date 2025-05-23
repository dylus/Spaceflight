import Foundation

public protocol ContentViewModel: ObservableObject {
    var articels: [Article] { get }
    func fetchArticles() async throws
}
