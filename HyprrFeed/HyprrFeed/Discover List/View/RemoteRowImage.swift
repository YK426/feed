import Foundation
import SwiftUI
import Combine

struct RemoteRowImage: View {

    // MARK: Properties

    let url: URL?
    private let imageLoader = RemoteImageURL()
   
    @State var image: UIImage? = nil

    var body: some View {
        Group {
            makeContent()
        }
        .onReceive(imageLoader.objectWillChange, perform: { image in
            self.image = image
        })
        .onAppear(perform: {
            self.imageLoader.load(url: self.url)
        })
        .onDisappear(perform: {
            self.imageLoader.cancel()
        })
    }

    private func makeContent() -> some View {
        if let image = image {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
        } else {
            return AnyView(Image("placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill))
        }
    }
}

fileprivate class RemoteImageURL: ObservableObject {
    
    // MARK: Properties
    
    private var cancellable: AnyCancellable?
    let objectWillChange = PassthroughSubject<UIImage?, Never>()

    func load(url: URL?) {
        guard let url = url else {
            self.objectWillChange.send(nil)
            return
        }
        self.cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map({ $0.data })
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .map({ UIImage(data: $0) })
            .replaceError(with: nil)
            .sink(receiveValue: { image in
                self.objectWillChange.send(image)
            })
    }

    func cancel() {
        cancellable?.cancel()
    }
}
