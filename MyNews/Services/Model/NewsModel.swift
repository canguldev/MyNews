//
//  NewsModel.swift
//  MyNews
//
//  Created by Can Gül on 1.09.2024.
//

import Foundation

struct News: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}
