//
//  HomePageVC.swift
//  MyNews
//
//  Created by Can Gül on 31.08.2024.
//

import UIKit

class HomePageVC: UIViewController {
    
    //MARK: - Variables
    var viewModel = HomePageViewModel()
    var cellDataSource: [NewsCellViewModel] = []
    
    //MARK: - UI Elements
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.color = .systemBlue
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Business", "Sports", "Technology", "Health"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(changeSegmented), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        fetchNews()
    }
    
    //MARK: - Helper Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Home Page"
        let activityIndicatorItem = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItem = activityIndicatorItem
        navigationItem.hidesBackButton = true
        configureWithExt()
    }
    
    private func configureWithExt() {
        view.addSubviewsFromExt(activityIndicator, segmentedControl, newsTableView)
        let standartPadding: CGFloat = 10
        segmentedControl.anchorFromExt(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: standartPadding, left: view.leftAnchor, paddingLeft: standartPadding, right: view.rightAnchor, paddingRight: standartPadding)
        newsTableView.anchorFromExt(top: segmentedControl.bottomAnchor, paddingTop: standartPadding, left: view.leftAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func bindViewModel() {
        viewModel.isloading.bind { [weak self] isLoading in
            guard let isloading = isLoading else { return }
            DispatchQueue.main.async {
                if isloading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] articles in
            guard let articles = articles else { return }
            self?.cellDataSource = articles
            self?.reloadTablView()
        }
    }
    
    private func fetchNews() {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        viewModel.fetchNews(segmentedIndex: selectedIndex)
    }
    
    private func reloadTablView() {
        newsTableView.setContentOffset(.zero, animated: false)
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
    
    //MARK: - @Actions
    @objc func changeSegmented() {
        viewModel.fetchNews(segmentedIndex: segmentedControl.selectedSegmentIndex)
    }
}

//MARK: - UITableViewDelegate
extension HomePageVC: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension HomePageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        let cellViewModel = self.cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
}

