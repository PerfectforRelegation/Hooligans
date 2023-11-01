//
//  NewsCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/29/23.
//

import UIKit

final class NewsPostCell: UICollectionViewCell {
    static let identifier = "newsCell"
    
    private let newsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "newspaper")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(post: Post) {
        self.titleLabel.text = post.title
    }
    
}

extension NewsPostCell {
    private func setupView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = self.frame.height * 0.2
        
        addSubview(newsIcon)
        newsIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().inset(14)
            make.width.height.equalTo(30)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsIcon.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
