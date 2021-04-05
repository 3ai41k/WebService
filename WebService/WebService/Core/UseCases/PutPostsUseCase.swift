//
//  PutPostsUseCase.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

struct PutPostsUseCase: UseCaseProtocol {
    
    var request: HTTPRequest {
        PutPostsRequest(id: post.id)
    }
    
    let post: Post
    let onSuccess: () -> Void
    let onFalure: (Error) -> Void
    
    func operationDidFinish(with error: Error) {
        onFalure(error)
    }
    
    func operationDidFinish(with statusCode: HTTPStatusCode, data: Data?) {
        if statusCode == .ok {
            onSuccess()
        } else {
            onFalure(statusCode)
        }
    }
    
}
