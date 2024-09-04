//
//  DetailPageViewModel.swift
//  MyNews
//
//  Created by Can Gül on 4.09.2024.
//

import Foundation

class DetailPageViewModel {
    var article: Article
    var title: String
    var author: String
    var description: String
    var newsURL: URL?
    var newsImage: URL?
    
    init(article: Article) {
        self.article = article
        self.title = article.title ?? ""
        self.author = article.author ?? "Anonim"
        self.description = article.description ?? ""
        self.newsURL = goToNewsWebsite(url: article.url ?? "")
        self.newsImage = mageImageUrl(article.urlToImage ?? "")
    }
    
    private func mageImageUrl(_ imageString: String) -> URL? {
        return URL(string: imageString) ?? URL(string: "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg")
    }
    
    private func goToNewsWebsite(url: String) -> URL? {
        guard let url = URL(string: url) else { return nil }
        return url
    }
}
