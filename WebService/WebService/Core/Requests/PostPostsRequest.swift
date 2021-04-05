//
//  PostPostsRequest.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

struct PostPostsRequest: HTTPRequest {
    
    var path: String {
        "/posts"
    }
    
    var httpMethod: HTTPMethod {
        .POST
    }
    
    var headers: [String: String]? {
        [
            "Content-type": "application/json;"
        ]
    }
    
    var body: Data?
    
}
