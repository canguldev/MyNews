//
//  NewsNetwork.swift
//  MyNews
//
//  Created by Can Gül on 1.09.2024.
//

import Foundation

protocol NewsNetworkProtocol {
    func fetchNews(completion: @escaping (Result<News, NetworError>) -> Void)
}

final class NewsNetwork: NewsNetworkProtocol {
    static let shared = NewsNetwork()
    private init() {}
    
    func fetchNews(completion: @escaping (Result<News, NetworError>) -> Void) {
        let endpoint = EndPoint.sport
        NetworkCaller.shared.fetchData(endpoint, completion: completion)
    }
}
