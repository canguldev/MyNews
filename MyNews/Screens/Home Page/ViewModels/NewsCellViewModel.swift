//
//  NewsCellViewModel.swift
//  MyNews
//
//  Created by Can Gül on 3.09.2024.
//

import Foundation

class NewsCellViewModel {
    var title: String
    var imageURL: URL?
    
    init(article: Article) {
        self.title = article.title ?? ""
        self.imageURL = makeImageUrl(article.urlToImage ?? "")
    }
    
    private func makeImageUrl(_ imageString: String) -> URL? {
        return URL(string: imageString) ?? URL(string: "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg")
    }
}
