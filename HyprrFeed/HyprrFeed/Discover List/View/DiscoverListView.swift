import Foundation
import Combine
import SwiftUI

/**
 * Root view
 */
struct DiscoverListView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var presenter: DiscoverPresenter
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            List(presenter.rowData) { data in
                DiscoverListRowSelector(rowType: data.rowType)
                    .onAppear {
                        if data.id == presenter.rowData.last?.id {
                            self.presenter.onScrolledAtBottom()
                        }
                    }
            }
            .onAppear {
                self.presenter.onAppear()
            }
            .navigationBarTitle(Text("Discover"))
        }
    }
}

/**
 * List does not allow different rows, because control flow statements cannot be executed directly in a function builder block.
 * This hack solves it.
 * @see https://developer.apple.com/forums/thread/118172
 */
fileprivate struct DiscoverListRowSelector: View {
   
    // MARK: Properties
    
    @State var rowType: DiscoverListRowData.RowType
        
    // MARK: Body
    
    var body: some View {
        selectedView()
    }
    
    private func selectedView() -> AnyView {
    
        func createChannelsFeedRow(_ data: ChannelsFeedRowData) -> some View {
            return ChannelsFeedRow(data: data)
                    .cornerRadius(15)
        }
        
        func createFastFoodFeedRow(_ data: FastFoodFeedRowData) -> some View {
            return FastFoodFeedRow(data: data)
                    .frame(height: 100, alignment: .center)
                    .cornerRadius(15)
        }
                
        switch rowType {
            case .large(let value):
                return AnyView(createChannelsFeedRow(value))
            case .small(let value):
                return AnyView(createFastFoodFeedRow(value))
        }
    }
}
