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
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                itemindicator.backgroundColor = .gray
            } else {
                itemindicator.backgroundColor = .white
            }
        }
    }
    
    var itemindicator = UIView()
        .backgroundColor(.black)
        .cornerRadius(2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configureCell(item: TabItem) {
        self.itemLabel.text = item.title
        self.isSelected = item.isTabbed
    }
    
}

extension TabItemCell {
    private func setupView() {
        
        self.addSubview(itemindicator)
        
        itemindicator.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            make.height.equalTo(5)
        }
        
        self.addSubview(itemLabel)
        
        itemLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(itemindicator.snp.top).offset(-10)
        }
        
    }
    
}
