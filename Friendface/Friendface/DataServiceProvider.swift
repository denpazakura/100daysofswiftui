//
//  DataServiceProvider.swift
//  Friendface
//
//  Created by denpazakura on 13/11/2020.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

class DataServiceProvider {
    private lazy var decoder = JSONDecoder()
    private var urlSession: URLSession
    private var service: DataService
    
    init(urlSession: URLSession = .shared,
         service: DataService) {
        self.urlSession = urlSession
        self.service = service
    }
    
    func download(completion: @escaping (Result<Data>) -> Void) {
        task(service.urlRequest, completion: completion)
    }
    
    func download<T>(decodeType: T.Type, completion: @escaping (Result<[T]>) -> Void) where T: Decodable {
        
        let url = URL(string: service.baseURL)!
        
        let request = URLRequest(url: url)
        
        task(request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                do {
                    let response = try decoder.decode([T].self, from: data)
                    completion(.success(response))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}

private extension DataServiceProvider {
    func task(_ request: URLRequest, completion: @escaping (Result<Data>) -> Void) {
        urlSession.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
    
    func task(url: URL, completion: @escaping (Result<Data>) -> Void) {
        urlSession.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}
