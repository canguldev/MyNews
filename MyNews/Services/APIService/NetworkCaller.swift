//
//  NetworkCaller.swift
//  MyNews
//
//  Created by Can Gül on 1.09.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T: Codable>(_ endpoint: EndPoint, completion: @escaping (Result<T, NetworError>) -> Void)
}

final class NetworkCaller: NetworkManagerProtocol {
    static let shared = NetworkCaller()
    let session = URLSession.shared
    private let decoder = JSONDecoder()
    private init() {}
    
    func fetchData<T: Codable>(_ endpoint: EndPoint, completion: @escaping (Result<T, NetworError>) -> Void) {
        
        let task = session.dataTask(with: endpoint.request()) { data, response, error in
            guard error == nil else {
                completion(.failure(.unableToCompleteError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let result = try self.decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError))
                }
            default:
                completion(.failure(.unknownError))
            }
        }
        task.resume()
    }
}
