//
//  PutPostsRequest.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

struct PutPostsRequest: HTTPRequest {
    
    var path: String {
        "/posts/\(id)"
    }
    
    var httpMethod: HTTPMethod {
        .PUT
    }
    
    var headers: [String: String]? {
        [
            "Content-type": "application/json;"
        ]
    }
    
    let id: Int
    
}
