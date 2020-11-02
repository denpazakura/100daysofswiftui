//
//  NetworkRequestFactory.swift
//  CupcakeCorner
//
//  Created by denpazakura on 02/11/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

class NetworkRequestFactory {
    func makePostRequest(for url: URL, encodedData: Data) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encodedData
        
        return request
    }
}
