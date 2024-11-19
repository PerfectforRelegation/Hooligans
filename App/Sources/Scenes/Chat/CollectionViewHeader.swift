//
//  ChatCollectionViewHeader.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import UIKit

final class CollectionViewHeader: UICollectionReusableView {
    static let identifier = "collectionViewHeader"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
//        label.font = Font.regular(size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    func configureCell(title: String) {
        titleLabel.text = title
    }
    
}

extension CollectionViewHeader {
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(5)
        }
        
    }
}
