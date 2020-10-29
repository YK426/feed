import SwiftUI

struct FastFoodFeedRow: View {
    
    // MARK: Properties
    
    var data: FastFoodFeedRowData
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            RemoteRowImage(url: data.image)
            VStack(alignment: .center) {
                Text(data.name)
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color(white: 1.0, opacity: 0.5))
                Text(data.title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .background(Color(white: 1.0, opacity: 0.5))
            }
            .padding(.all)
        }
    }
}

struct FastFoodView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FastFoodFeedRow(data: FastFoodFeedRowData(name: "Music", title: "Desolation", image: nil))
                .padding(.horizontal)
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
