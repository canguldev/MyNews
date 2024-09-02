//
//  NetworkConstants.swift
//  MyNews
//
//  Created by Can Gül on 1.09.2024.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworError: String, Error {
    case unableToCompleteError
    case invalidResponse
    case invalidData
    case unknownError
    case decodingError
}

protocol EndPointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var apiKey: String { get }
    var method: HTTPMethod { get }
    func newsApiUrl() -> String
    func request() -> URLRequest
}

enum EndPoint {
    case business
    case sport
    case tech
    case health
}

extension EndPoint: EndPointProtocol {
    var baseUrl: String {
        return "https://newsapi.org/v2/everything"
    }
    
    var path: String {
        switch self {
        case .business:
            return "?q=business"
        case .sport:
            return "?q=sport"
        case .tech:
            return "?q=tech"
        case .health:
            return "?q=health"
        }
    }
    
    var apiKey: String {
        return ""
    }
    
    var method: HTTPMethod {
        switch self {
        case .business:
            return .get
        case .sport:
            return .get
        case .tech:
            return .get
        case .health:
            return .get
        }
    }
    
    func newsApiUrl() -> String {
        return "\(baseUrl)\(path)\(apiKey)"
    }
    
    func request() -> URLRequest {
        
        guard let component = URLComponents(string: newsApiUrl()) else {
            fatalError("Base URL Error")
        }
        
        guard let url = component.url else {
            fatalError("URL Error from component")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
