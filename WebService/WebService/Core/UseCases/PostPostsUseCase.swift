//
//  PostPostsUseCase.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

struct PostPostsUseCase: UseCaseProtocol {
    
    var request: HTTPRequest {
        PostPostsRequest(body: post.data)
    }
    
    let post: Post
    let onSuccess: (Post) -> Void
    let onFalure: (Error) -> Void
    
    func operationDidFinish(with error: Error) {
        onFalure(error)
    }
    
    func operationDidFinish(with statusCode: HTTPStatusCode, data: Data?) {
        if statusCode == .created, let data = data {
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let id = dictionary["id"] as? Int {
                    let createdPost = Post(userId: post.userId, id: id, title: post.title, body: post.body)
                    onSuccess(createdPost)
                } else {
                    onFalure(UseCaseError.cannotParseData)
                }
            } catch {
                onFalure(UseCaseError.cannotParseData)
            }
        } else {
            onFalure(statusCode)
        }
    }
    
}
