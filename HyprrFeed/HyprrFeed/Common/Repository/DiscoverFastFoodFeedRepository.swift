import Foundation
import Apollo

/**
 * Simple repository implementation.
 * WARNING:  Non thread safe implementation
 */
class DiscoverFastFoodFeedRepository: OutputStreamRepositoty {
    
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
    
    func read() -> OutputStreamRepositotyResult<[DiscoverFastFoodFeed]> {
        let group = DispatchGroup()
        var output: OutputStreamRepositotyResult<[DiscoverFastFoodFeed]> = .success([])
        
        func handleResponce(result: (Result<GraphQLResult<DiscoverFastFoodFeedQuery.Data>, Error>)) {
            currentQuery = nil
            
            switch result {
            case .success(let responce): output = .success(processResponce(data: responce.data))
            case .failure(let error): output = .failure(error)
            }
            
            group.leave()
        }
        
        group.enter()
        currentQuery = client.fetch(
            query: DiscoverFastFoodFeedQuery(after: currentCursor),
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
    
    private func processResponce(data: DiscoverFastFoodFeedQuery.Data?) -> [DiscoverFastFoodFeed] {
        guard let discoverFastFoodFeed = data?.discoverFastFoodFeed else {
            return []
        }
     
        currentCursor = discoverFastFoodFeed.edges.last?.cursor
        
        return discoverFastFoodFeed.edges
            .map { $0.node }
            .map { node -> DiscoverFastFoodFeed in
                let contentImage = URL(string: node.files.first?.asAttachmentImage?.url ?? "")
                return DiscoverFastFoodFeed(id: node.id, authorName: node.author.name, caption: node.caption, contentImage: contentImage)
        }
    }
}
