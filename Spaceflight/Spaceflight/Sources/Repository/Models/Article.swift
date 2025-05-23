import Foundation

public struct Article: Identifiable {
    public let id = UUID()
    
    let title: String
    let imageURL: String?
    let eventID: Int?
    
    init (
        title: String,
        imageURL: String?,
        eventID: Int?
    ) {
        self.title = title
        self.imageURL = imageURL
        self.eventID = eventID
    }
    
    init(
        from articleDTO: ArticleDTO
    ) {
        self.title = articleDTO.title ?? "No title"
        self.imageURL = articleDTO.imageURL
        self.eventID = articleDTO.events?.first?.eventID
    }
}
