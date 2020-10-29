import Foundation

struct DiscoverChannelsFeed: Identifiable {
    let id: String
    let title: String
    let content: String
    let authorName: String
    let authorAvatarImage: URL?
    let contentImage: URL?
}
