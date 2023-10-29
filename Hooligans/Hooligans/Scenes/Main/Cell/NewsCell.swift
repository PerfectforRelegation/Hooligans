//
//  NewsCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/29/23.
//

import UIKit

final class NewsCell: UICollectionViewCell {
    static let identifier = "newsCell"
    
    private let titleLabel = UILabel()
    
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

extension NewsCell {
    private func setupView() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
