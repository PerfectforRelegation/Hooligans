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
    private let coinImage = UIImageView()
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
    
    
    private let pointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    // MARK: - Init Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configureCell(user: User) {
        coinImage.image = UIImage(named: "coin")
        pointLabel.text = String(user.betPoint)
    }
    
}

extension ProfileCell {
    private func setupView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = self.frame.height * 0.2
        
        self.addSubview(coinImage)
        
        coinImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        self.addSubview(pointLabel)
        
        pointLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(coinImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(10)
        }
        
        
    }

}
