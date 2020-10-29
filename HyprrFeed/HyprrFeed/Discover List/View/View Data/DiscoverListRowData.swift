import Foundation

/**
 * Present different types of content in the UI list
 */
struct DiscoverListRowData: Identifiable {
    
    /**
     * It's a unique identifier required for the SwiftUI List
     */
    var id: String = UUID().uuidString
    
    /**
     * Type of content. Must have a UI view for each case
     */
    enum RowType {
        case large(ChannelsFeedRowData)
        case small(FastFoodFeedRowData)
    }
    
    var rowType: RowType
}
