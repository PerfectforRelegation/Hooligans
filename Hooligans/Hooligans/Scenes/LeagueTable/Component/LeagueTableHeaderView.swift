//
//  LeagueTableHeaderView.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/30.
//

import UIKit
import SnapKit

class LeagueTableHeaderView: UIView {
    let maxHeight: CGFloat = 150
    let minHeight: CGFloat = 100
    
    let headerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = CGRect(origin: .zero, size: .zero)
        image.image = UIImage(named: "EPL")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

}

extension LeagueTableHeaderView {
    private func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(headerImage)
        
        headerImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(150*1.8)
        }
        
    }
}
