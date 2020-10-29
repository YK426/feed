import Foundation
import Combine
import SwiftUI

protocol DiscoverPresenterInterface  {
    
    /**
     * Called when the view appears
     */
    func onAppear()
    
    /**
     * Called when scrolling to the end of the list
     */
    func onScrolledAtBottom()
}

final class DiscoverPresenter: DiscoverPresenterInterface, ObservableObject {
    
    // MARK: Properties
    
    @Published private(set) var rowData: [DiscoverListRowData] = .init()
    private weak var interactor: DiscoverInteractorInterface?
    
    // MARK: Initialization
    
    init(interactor: DiscoverInteractorInterface) {
        self.interactor = interactor
    }
    
    // MARK: DiscoverPresenterInterface
    
    func onAppear() {
        interactor?.loadMore(with: self)
    }
    
    func onScrolledAtBottom() {
        interactor?.loadMore(with: self)
    }
}

extension DiscoverPresenter: DiscoverInteractionInterface {
    func dataWasUpdated(feeds: [DiscoverFeed]) {
        rowData.append(contentsOf: feeds.map(mapToViewData))
    }
    
    func somethingWrong() {
        
    }
    
    private func mapToViewData(value: DiscoverFeed) -> DiscoverListRowData {
        switch value {
        case .channels(let channelsFeed):
            let data = ChannelsFeedRowData(
                        name: channelsFeed.authorName,
                        title: channelsFeed.title,
                        content: channelsFeed.contentImage,
                        avatar: channelsFeed.authorAvatarImage,
                        tags: channelsFeed.content)
            return DiscoverListRowData(rowType: .large(data))
        case .fastFood(let fastFoodFeed):
            let data = FastFoodFeedRowData(
                        name: fastFoodFeed.authorName,
                        title: fastFoodFeed.caption ?? "",
                        image: fastFoodFeed.contentImage)
            return DiscoverListRowData(rowType: .small(data))
        }
    }
}
