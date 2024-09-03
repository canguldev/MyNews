//
//  NewsNetwork.swift
//  MyNews
//
//  Created by Can Gül on 1.09.2024.
//

import Foundation

protocol NewsNetworkProtocol {
    func fetchNews(endpoint: EndPoint, completion: @escaping (Result<News, NetworError>) -> Void)
}

final class NewsNetwork: NewsNetworkProtocol {
    static let shared = NewsNetwork()
    private init() {}
    
    func fetchNews(endpoint: EndPoint, completion: @escaping (Result<News, NetworError>) -> Void) {
        NetworkCaller.shared.fetchData(endpoint, completion: completion)
    }
}
