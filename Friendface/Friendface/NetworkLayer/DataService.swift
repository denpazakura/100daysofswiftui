//
//  DataService.swift
//  Friendface
//
//  Created by denpazakura on 13/11/2020.
//

import Foundation

enum ServiceMethod: String {
    case get = "GET"
}

protocol DataService {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: ServiceMethod { get }
}

extension DataService {
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("Can't configure url with current parameters")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
    
    private var url: URL? {
        URLFactory().makeURL(method: method, baseURL: baseURL, path: path, parameters: parameters)
    }
}
