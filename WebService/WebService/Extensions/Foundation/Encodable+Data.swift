//
//  Encodable+Data.swift
//  WebService
//
//  Created by Nikita Lizogubov on 05/04/2021.
//

import Foundation

extension Encodable {
    
    var data: Data? {
        try? JSONEncoder().encode(self)
    }
    
}
