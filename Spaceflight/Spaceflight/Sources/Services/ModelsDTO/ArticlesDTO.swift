// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let articles = try? JSONDecoder().decode(Articles.self, from: jsonData)

import Foundation

// MARK: - Articles
struct ArticlesDTO: Codable {
    let count: Int?
    let next, previous: String?
    let results: [ArticleDTO]?
}

// MARK: - Article
struct ArticleDTO: Codable {
    let id: Int?
    let title: String?
    let authors: [AuthorDTO]?
    let url, imageURL, newsSite, summary: String?
    let publishedAt, updatedAt: String?
    let featured: Bool?
    let launches: [LaunchDTO]?
    let events: [EventDTO]?

    enum CodingKeys: String, CodingKey {
        case id, title, authors, url
        case imageURL = "image_url"
        case newsSite = "news_site"
        case summary
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case featured, launches, events
    }
}

// MARK: - Author
struct AuthorDTO: Codable {
    let name: String?
    let socials: SocialsDTO?
}

// MARK: - Socials
struct SocialsDTO: Codable {
    let x, youtube, instagram, linkedin: String?
    let mastodon, bluesky: String?
}

// MARK: - Event
struct EventDTO: Codable {
    let eventID: Int?
    let provider: String?

    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case provider
    }
}

// MARK: - Launch
struct LaunchDTO: Codable {
    let launchID, provider: String?

    enum CodingKeys: String, CodingKey {
        case launchID = "launch_id"
        case provider
    }
}
