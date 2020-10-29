import Foundation
import Combine
import SwiftUI

final class DiscoverAssembly {
    
    // MARK: Properties
    
    private(set) var interactor: DiscoverInteractorInterface
    
    private(set) var associatedView: AnyView
    private(set) var presenter: DiscoverPresenterInterface
    
    // MARK: Assembly
    
    init() {
        interactor = DiscoverInteractor()
        let presenter = DiscoverPresenter(interactor: interactor)
        
        let view = DiscoverListView().environmentObject(presenter)
        
        self.associatedView = AnyView(view)
        self.presenter = presenter
    }
}
