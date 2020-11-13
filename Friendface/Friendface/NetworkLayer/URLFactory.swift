//
//  URLFactory.swift
//  Friendface
//
//  Created by denpazakura on 13/11/2020.
//

import Foundation

struct URLFactory {
    func makeURL(method: ServiceMethod, baseURL: String, path: String, parameters: [String: Any]?) -> URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        
        if method == .get {
            guard let parameters = parameters as? [String: String] else {
                fatalError("parameters for GET http method must conform to [String: String]")
            }
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return urlComponents?.url
    }
}
