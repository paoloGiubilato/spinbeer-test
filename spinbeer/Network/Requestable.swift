//
//  Requestable.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import Foundation

protocol Requestable {
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryParams: [String : String] { get }
    
    /// Provide a custom decoder if needed. Es. different data format or something similar.
    func decode(responseData: Data) throws -> Response
}

///Extensions for a default implementations
extension Requestable where Response: Decodable {
    func decode(responseData: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: responseData)
    }
}

extension Requestable {
    var headers: [String : String] {
        [:]
    }
    
    var queryParams: [String : String] {
        [:]
    }
}
