import SwiftUI
import URLImage

struct ArticleListItemView: View {
    let article: Article

    var body: some View {
        HStack {
            if let imageURL = article.imageURL, let url = URL(string: imageURL) {
                URLImage(url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .foregroundColor(.black)
                    .font(.system(size: 10, weight: .semibold))
            }
        }
    }
}
