//
//  SocialButtonCell.swift
//  Hooligans
//
//  Created by 정명곤 on 11/6/23.
//

import UIKit

final class SocialCell: UICollectionViewCell {
    static let identifier = "socialButtonCell"
    
    let socialButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Font.medium(size: 16)
        button.setTitleColor(.black, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.tintColor = .black
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(social: Social) {
        socialButton.setTitle(social.platform, for: .normal)
        socialButton.backgroundColor = social.color
        socialButton.setImage(UIImage(named: social.image), for: .normal)
    }
}

extension SocialCell {
    private func setupView() {
        addSubview(socialButton)
        socialButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(56)
        }
    }
}
