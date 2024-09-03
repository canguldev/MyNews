//
//  DetailPageVC.swift
//  MyNews
//
//  Created by Can Gül on 3.09.2024.
//

import UIKit

class DetailPageVC: UIViewController {
    
    //MARK: - UI Elements
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var newsAuthorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var newsDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textAlignment = .justified
        textView.isEditable = false
        return textView
    }()
    
    private lazy var websiteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to website", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goToWebsite), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Helper Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "News Detail"
        configureWithExt()
    }
    
    private func configureWithExt() {
        view.addSubviewsFromExt(newsTitleLabel, newsImageView, newsAuthorLabel, newsDescriptionTextView, websiteButton)
        let standartPadding: CGFloat = 10
        let buttonHeight: CGFloat = 40
        let imageHeight: CGFloat = UIScreen.main.bounds.height / 4
        newsTitleLabel.anchorFromExt(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: standartPadding, left: view.leftAnchor, paddingLeft: standartPadding, right: view.rightAnchor, paddingRight: standartPadding)
        newsImageView.anchorFromExt(top: newsTitleLabel.bottomAnchor, paddingTop: standartPadding, left: view.leftAnchor, paddingLeft: standartPadding, right: view.rightAnchor, paddingRight: standartPadding, height: imageHeight)
        newsAuthorLabel.anchorFromExt(top: newsImageView.bottomAnchor, paddingTop: standartPadding, left: view.leftAnchor, paddingLeft: standartPadding, right: view.rightAnchor, paddingRight: standartPadding)
        newsDescriptionTextView.anchorFromExt(top: newsAuthorLabel.bottomAnchor, paddingTop: standartPadding, left: view.leftAnchor, paddingLeft: standartPadding, right: view.rightAnchor, paddingRight: standartPadding)
        websiteButton.anchorFromExt(top: newsDescriptionTextView.bottomAnchor, paddingTop: standartPadding, left: view.leftAnchor, paddingLeft: standartPadding, right: view.rightAnchor, paddingRight: standartPadding, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: standartPadding, height: buttonHeight)
    }
    
    @objc func goToWebsite() {
        
    }

}
