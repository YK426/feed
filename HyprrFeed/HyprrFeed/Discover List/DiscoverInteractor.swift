import Foundation
import Apollo

/**
 * This protocol is used to invert user interface dependencies.
 */
protocol DiscoverInteractionInterface {
    
    /**
     * Receive new data
     */
    func dataWasUpdated(feeds: [DiscoverFeed])
    func somethingWrong()
}

protocol DiscoverInteractorInterface: class {
    
    /**
     * Load next page.
     */
    func loadMore(with interactionInterface: DiscoverInteractionInterface)
}

final class DiscoverInteractor: DiscoverInteractorInterface {
    
    typealias T = [DiscoverFeed]
    
    // MARK: Properties
    
    // Basically properties like this should be injected for testing
    private let repository = DiscoverRepository()
    private let queue = DispatchQueue.global(qos: .userInitiated)
   
    // MARK: State
    
    private var isLoading = false
    
    // MARK: DiscoverInteractorInterface
    
    func loadMore(with interactionInterface: DiscoverInteractionInterface) {
        guard isLoading == false else {
            return
        }
        
        isLoading = true
        
        queue.async { [weak self] in
            guard let `self` = self else {
                return
            }
            
            let next = self.repository.read()
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch next {
                case .success(let result): interactionInterface.dataWasUpdated(feeds: result)
                case .failure: interactionInterface.somethingWrong()
                }
            }
        }
    }
}
