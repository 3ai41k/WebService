//
//  GetPostsUseCase.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

struct GetPostsUseCase: UseCaseProtocol {
    
    var request: HTTPRequest {
        GetPostsRequest()
    }
    
    let onSuccess: ([Post]) -> Void
    let onFalure: (Error) -> Void
    
    func operationDidFinish(with error: Error) {
        onFalure(error)
    }
    
    func operationDidFinish(with statusCode: HTTPStatusCode, data: Data?) {
        if statusCode == .ok, let data = data {
            do {
                let result = try JSONDecoder().decode([Post].self, from: data)
                onSuccess(result)
            } catch {
                onFalure(UseCaseError.cannotParseData)
            }
        } else {
            onFalure(statusCode)
        }
    }
    
}
