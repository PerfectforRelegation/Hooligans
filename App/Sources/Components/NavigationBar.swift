//
//  NavigationBar.swift
//  Hooligans
//
//  Created by 정명곤 on 11/10/23.
//

import UIKit

final class NavigationBar: UIView {
    
    let leftItem: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
//        label.font = Font.medium(size: 18)
        label.textColor = .white
        return label
    }()
    

    init(background: UIColor, leftItem: UIImage? = nil, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = background
        self.titleLabel.text = title
        if let leftItem = leftItem {
            self.leftItem.setImage(leftItem, for: .normal)
        }
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NavigationBar {
    private func setupView() {
        addSubview(leftItem)
        leftItem.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
}
