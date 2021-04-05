//
//  GetPostsRequest.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

struct GetPostsRequest: HTTPRequest {
    
    var path: String {
        "/posts"
    }
    
    var httpMethod: HTTPMethod {
        .GET
    }
    
    var queryItem: [URLQueryItem]? {
        [
            URLQueryItem(name: "_start", value: "0"),
            URLQueryItem(name: "_limit", value: "5")
        ]
    }
    
    var headers: [String: String]? {
        [
            "Content-type": "application/json;"
        ]
    }
    
}
