//
//  HomHeaderView.swift
//  Hooligans
//
//  Created by 정명곤 on 10/18/23.
//

import UIKit
import SnapKit

class HomeHeaderView: UIView {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    private func setupView() {
        self.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide)
            make.width.height.equalTo(40)
        }
    }
}
