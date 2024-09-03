//
//  HomePageViewModel.swift
//  MyNews
//
//  Created by Can Gül on 3.09.2024.
//

import Foundation

class HomePageViewModel {
    var isloading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[NewsCellViewModel]> = Observable(nil)
    var dataSource: News?
    var endpoint: EndPoint?
    
    func numberOfArticles() -> Int {
        return dataSource?.articles.count ?? 0
    }
    
    private func changeEndpoint(segmentedIndex: Int) {
        switch segmentedIndex {
        case 0:
            endpoint = .business
        case 1:
            endpoint = .sport
        case 2:
            endpoint = .tech
        case 3:
            endpoint = .health
        default:
            endpoint = .business
        }
    }
    
    func fetchNews(segmentedIndex: Int) {
        if isloading.value ?? true {
            return
        }
        isloading.value = true
        changeEndpoint(segmentedIndex: segmentedIndex)
        guard let endpoint = endpoint else { return }
        NewsNetwork.shared.fetchNews(endpoint: endpoint) { [weak self] result in
            self?.isloading.value = false
            switch result {
            case .success(let data):
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.articles.compactMap({NewsCellViewModel(article: $0)})
    }
    
    func getSelectedArticle(index: Int) -> Article? {
        guard let selectedArticle = dataSource?.articles[index] else { return nil }
        return selectedArticle
    }
}
