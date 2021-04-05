//
//  UseCaseProtocol.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

protocol UseCaseProtocol {
    var request: HTTPRequest { get }
    func operationDidFinish(with error: Error)
    func operationDidFinish(with statusCode: HTTPStatusCode, data: Data?)
}
