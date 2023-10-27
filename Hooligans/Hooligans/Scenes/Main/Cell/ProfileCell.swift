//
//  MainProfileCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/24/23.
//

import UIKit

final class ProfileCell: UICollectionViewCell {
    static let identifier = "profileCell"
    
    
    // MARK: - View Initialize
    private let profileImage = UIImageView()
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
    
    
    private let nameLabel = UILabel()
        .backgroundColor(.red)
    
    // MARK: - Init Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configureCell(profile: Profile) {
        profileImage.image = UIImage(systemName: "star.fill")
    }
    
}

extension ProfileCell {
    private func setupView() {
        self.backgroundColor = .yellow
        self.layer.cornerRadius = self.frame.height * 0.2
        self.nameLabel.text = "HI"
        
        
        self.addSubview(profileImage)
        
        profileImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(10)
        }
        
        
    }

}
