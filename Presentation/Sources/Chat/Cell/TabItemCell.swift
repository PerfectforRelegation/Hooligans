//
//  TabItemCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/19/23.
//

import UIKit

final class TabItemCell: UICollectionViewCell {
    static let identifier = "tabItemCell"
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.tintColor = .black
        return label
    }()

}

extension TabItemCell {
    private func setupView() {

        self.addSubview(itemLabel)
        
        itemLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
    }
    
}
