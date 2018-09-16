import UIKit


protocol ListProtocol: class {
    var presenter: PostListInteractorOutputProtocol? { get set }
    var localDatamanager: PostListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol? { get set }
    

    func retrievePostList()
}


protocol PostListInteractorOutputProtocol: class {
    func didRetrievePosts(_ posts: [PostModel])
    func onError()
}

protocol PostListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol? { get set }
    
    func retrievePostList()
}

protocol PostListLocalDataManagerInputProtocol: class {
    func retrievePostList() throws -> [Post]
    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws
}


protocol PostListRemoteDataManagerOutputProtocol: class {
    func onPostsRetrieved(_ posts: [PostModel])
    func onError()
}
