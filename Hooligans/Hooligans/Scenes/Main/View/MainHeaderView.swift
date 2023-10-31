//
//  HomHeaderView.swift
//  Hooligans
//
//  Created by 정명곤 on 10/18/23.
//

import UIKit
import SnapKit

class MainHeaderView: UIView {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coin")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainHeaderView {
    private func setupView() {
        self.backgroundColor = .white
//        self.layer.opacity = 0.5
        
        self.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.height.equalTo(40)
        }
    }
}
