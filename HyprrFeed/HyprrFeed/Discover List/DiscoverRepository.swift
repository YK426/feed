import Foundation
import Apollo

enum DiscoverFeedError: Error {
    case failureOfAllSources
}

enum DiscoverFeed {
    case channels(DiscoverChannelsFeed)
    case fastFood(DiscoverFastFoodFeed)
}

class DiscoverRepository: OutputStreamRepositoty {
    
    // MARK: Properties
    
    private let channelsFeedRepository: DiscoverChannelsFeedRepository
    private let fastFoodFeedRepository: DiscoverFastFoodFeedRepository
    
    // MARK: Initialization
    
    init() {
        
        // In real project `client` should be captured by Scope Graph
        let client = ApolloClient(url: URL(string: "https://backend.hyprr.com/graphql")!)
        let fetchQueue = DispatchQueue.global(qos: .default)
        
        channelsFeedRepository = DiscoverChannelsFeedRepository(client: client, queue: fetchQueue)
        fastFoodFeedRepository = DiscoverFastFoodFeedRepository(client: client, queue: fetchQueue)
    }
    
    // MARK: OutputStreamRepositoty
    
    func read() -> OutputStreamRepositotyResult<[DiscoverFeed]> {
        var output: [DiscoverFeed] = .init()
        var failure = false
        
        switch channelsFeedRepository.read() {
        case .success(let result): output.append(contentsOf: result.map { .channels($0) })
        case .failure: failure = true
        }
        
        switch fastFoodFeedRepository.read() {
        case .success(let result): output.append(contentsOf: result.map { .fastFood($0) })
        case .failure: failure = true
        }
        
        if failure && output.isEmpty {
            return .failure(DiscoverFeedError.failureOfAllSources)
        }
        
        return .success(output)
    }
    
    func reset() {
        channelsFeedRepository.reset()
        fastFoodFeedRepository.reset()
    }
}
