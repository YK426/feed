import Foundation

enum OutputStreamRepositotyResult<T> {
    case success(T)
    case failure(Error)
}

protocol OutputStreamRepositoty {
    
    associatedtype T
    
    func read() -> OutputStreamRepositotyResult<T>
    func reset()
}
