//
//  ViewController.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webService = WebService()
        
        let getUseCase = GetPostsUseCase { (posts) in
            print(posts)
        } onFalure: { (error) in
            print(error.localizedDescription)
        }

        webService.perform(getUseCase)
        
        let createPost = Post(userId: 1, id: 1, title: "CreatePost", body: "CreatePost")
        let postUseCase = PostPostsUseCase(post: createPost) { (post) in
            print(post)
        } onFalure: { (error) in
            print(error.localizedDescription)
        }

        webService.perform(postUseCase)
        
        let updatePost = Post(userId: 1, id: 1, title: "UpdatePost", body: "UpdatePost")
        let putUseCase = PutPostsUseCase(post: updatePost) {
            print(updatePost)
        } onFalure: { (error) in
            print(error.localizedDescription)
        }
        
        webService.perform(putUseCase)
        
        let deleteUseCase = DeletePostsUseCase(post: updatePost) {
            print("Post \(updatePost) has been deleted")
        } onFalure: { (error) in
            print(error.localizedDescription)
        }

        webService.perform(deleteUseCase)
    }


}

