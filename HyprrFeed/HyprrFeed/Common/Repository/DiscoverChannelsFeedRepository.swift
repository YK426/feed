import Foundation
import Apollo

/**
 * Simple repository implementation.
 * WARNING:  Non thread safe implementation
 */
class DiscoverChannelsFeedRepository: OutputStreamRepositoty {
    
    // MARK: Properties
    
    private let client: ApolloClient
    private let fetchQueue: DispatchQueue
    
    // MARK: State
    
    private var currentCursor: String?
    private var currentQuery: Cancellable?
    
    // MARK: Initialization
    
    init(client: ApolloClient, queue: DispatchQueue) {
        self.client = client
        self.fetchQueue = queue
    }
    
    // MARK: OutputStreamRepositoty
    
    func read() -> OutputStreamRepositotyResult<[DiscoverChannelsFeed]> {
        let group = DispatchGroup()
        var output: OutputStreamRepositotyResult<[DiscoverChannelsFeed]> = .success([])
        
        func handleResponce(result: (Result<GraphQLResult<DiscoverChannelsFeedQuery.Data>, Error>)) {
            currentQuery = nil
            
            switch result {
            case .success(let responce): output = .success(processResponce(data: responce.data))
            case .failure(let error): output = .failure(error)
            }
            
            group.leave()
        }
        
        group.enter()
        currentQuery = client.fetch(
            query: DiscoverChannelsFeedQuery(after: currentCursor),
            cachePolicy: .returnCacheDataAndFetch,
            queue: fetchQueue, resultHandler: handleResponce)
        
        // TODO: catch the endless wait
        group.wait()
        
        return output
    }

    func reset() {
        currentQuery?.cancel()
        currentCursor = nil
    }
    
    // MARK: Responce mapping
    
    private func processResponce(data: DiscoverChannelsFeedQuery.Data?) -> [DiscoverChannelsFeed] {
        guard let discoverChannelsFeed = data?.discoverChannelsFeed else {
            return []
        }
     
        currentCursor = discoverChannelsFeed.edges.last?.cursor
        
        return discoverChannelsFeed.edges
            .map { $0.node }
            .map { node -> DiscoverChannelsFeed in
                return DiscoverChannelsFeed(
                        id: node.id,
                        title: node.title,
                        content: node.content,
                        authorName: node.author.name,
                        authorAvatarImage: URL(string: node.author.avatar?.big ?? ""),
                        contentImage: URL(string: node.video?.cover?.thumbnails.big.url ?? ""))
        }
    }
}
