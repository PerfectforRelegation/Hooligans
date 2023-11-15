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
    private let myPointLabel: UILabel =  {
        let label = UILabel()
        label.text = "나의 포인트"
        label.font = Font.medium(size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private let coinImage = UIImageView()
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
    
    private let pointLabel: UILabel = {
        let label = UILabel()
        label.font = Font.semibold(size: 26)
        return label
    }()
    
    let historyButton: UIButton = {
        let button = UIButton()
        button.setTitle("내역", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = Font.regular(size: 16)
        return button
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
    
    func configureCell(user: MainUser) {
        coinImage.image = UIImage(named: "coin")
        pointLabel.text = numberFormatter(number: user.betPoint)+"P"
    }
    
}

extension ProfileCell {
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = self.frame.height * 0.1
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowPath = nil
        
        addSubview(myPointLabel)
        myPointLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        
        addSubview(coinImage)
        coinImage.snp.makeConstraints { make in
            make.top.equalTo(myPointLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(20)
        }
        
        addSubview(pointLabel)
        pointLabel.snp.makeConstraints { make in
            make.top.equalTo(myPointLabel.snp.bottom).offset(15)
            make.leading.equalTo(coinImage.snp.trailing).offset(5)
            make.width.equalTo(100)
        }
        
        addSubview(historyButton)
        historyButton.snp.makeConstraints { make in
            make.centerY.equalTo(pointLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
            make.width.equalTo(55)
            make.height.equalTo(30)
        }
        
    }

}
