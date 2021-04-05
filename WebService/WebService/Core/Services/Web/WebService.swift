//
//  WebService.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

protocol HTTPExecutable {
    func perform(_ useCase: UseCaseProtocol)
}

final class WebService {
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let seesion = URLSession(configuration: configuration)
        return seesion
    }()
    
}

extension WebService: HTTPExecutable {
    
    func perform(_ useCase: UseCaseProtocol) {
        let request = useCase.request.resume()
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                useCase.operationDidFinish(with: error)
            } else {
                guard let response = response as? HTTPURLResponse, let status = response.status else { return }
                useCase.operationDidFinish(with: status, data: data)
            }
        }
        dataTask.resume()
    }
    
}
