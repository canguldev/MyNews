//
//  NewsCell.swift
//  MyNews
//
//  Created by Can Gül on 3.09.2024.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    //MARK: - Variables
    static let identifier = "NewsCell"
    
    //MARK: - UI Elements
    private lazy var newsImageView: UIImageView = {
        let newsImageView = UIImageView()
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.clipsToBounds = true
        newsImageView.layer.cornerRadius = 10
        return newsImageView
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let newsTitleLabel = UILabel()
        newsTitleLabel.textColor = .label
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.font = UIFont.systemFont(ofSize: 16)
        newsTitleLabel.textAlignment = .left
        return newsTitleLabel
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Functions
    func setupCell(viewModel: NewsCellViewModel) {
        self.newsImageView.kf.setImage(with: viewModel.imageURL)
        self.newsTitleLabel.text = viewModel.title
    }
    
    private func setupUI() {
        addSubviewsFromExt(newsImageView, newsTitleLabel)
        let standartPadding: CGFloat = 10
        let imageHeight: CGFloat = UIScreen.main.bounds.height / 4
        newsImageView.anchorFromExt(top: topAnchor, paddingTop: standartPadding, left: leftAnchor, paddingLeft: standartPadding, right: rightAnchor, paddingRight: standartPadding, height: imageHeight)
        newsTitleLabel.anchorFromExt(top: newsImageView.bottomAnchor, paddingTop: standartPadding, left: leftAnchor, paddingLeft: standartPadding, right: rightAnchor, paddingRight: standartPadding, bottom: bottomAnchor, paddingBottom: standartPadding)
    }
}
