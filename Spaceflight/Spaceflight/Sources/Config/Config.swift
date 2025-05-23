protocol ConfigProtocol {
    var articlesURL: String { get }
}

struct Config: ConfigProtocol {
    let articlesURL = "https://api.spaceflightnewsapi.net/v4/articles/"
}

