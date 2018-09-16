//
//  PostListPresenter.swift
//  KotlinDomain
//
//  Created by Villar, Inaki (Agoda) on 16/9/2561 BE.
//  Copyright © 2561 Villar, Inaki (Agoda). All rights reserved.
//

import Foundation

class PostListPresenter: PostListPresenterProtocol {
    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showPostDetail(forPost post: PostModel) {
        wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }
    
}

extension PostListPresenter: PostListInteractorOutputProtocol {
    
    func didRetrievePosts(_ posts: [PostModel]) {
        view?.hideLoading()
        view?.showPosts(with: posts)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}
