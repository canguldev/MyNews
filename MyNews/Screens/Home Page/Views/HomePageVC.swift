//
//  HomePageVC.swift
//  MyNews
//
//  Created by Can Gül on 31.08.2024.
//

import UIKit

class HomePageVC: UIViewController {

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
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
           tableView.delegate = self
           tableView.dataSource = self
           return tableView
       }()
       
       //MARK: - Lifecycle
       override func viewDidLoad() {
           super.viewDidLoad()
           setupUI()
       }
       
       //MARK: - Helper Functions
       private func setupUI() {
           view.backgroundColor = .systemBackground
           title = "Home Page"
           let activityIndicatorItem = UIBarButtonItem(customView: activityIndicator)
           navigationItem.rightBarButtonItem = activityIndicatorItem
           navigationItem.hidesBackButton = true
           view.addSubviewsFromExt(activityIndicator, segmentedControl, newsTableView)
           let standartPadding: CGFloat = 10
           segmentedControl.anchorFromExt(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: standartPadding, left: view.leftAnchor, paddingLeft: standartPadding, right: view.rightAnchor, paddingRight: standartPadding)
           newsTableView.anchorFromExt(top: segmentedControl.bottomAnchor, paddingTop: standartPadding, left: view.leftAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
       }
       
       //MARK: - @Actions
       @objc func changeSegmented() {
           
       }
   }

   //MARK: - UITableViewDelegate
   extension HomePageVC: UITableViewDelegate {
       
   }

   //MARK: - UITableViewDataSource
   extension HomePageVC: UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = newsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           return cell
       }
   }

