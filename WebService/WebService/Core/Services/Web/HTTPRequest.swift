//
//  HTTPRequest.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

protocol HTTPRequest {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var queryItem: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

extension HTTPRequest {
    
    var queryItem: [URLQueryItem]? {
        nil
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var body: Data? {
        nil
    }
    
    private var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path
        components.queryItems = queryItem
        return components
    }
    
    func resume() -> URLRequest {
        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
    
}
