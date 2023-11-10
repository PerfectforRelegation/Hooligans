//
//  ChatButtonCell.swift
//  Hooligans
//
//  Created by 정명곤 on 11/9/23.
//

import UIKit

class ChatButtonCell: UICollectionViewCell {
    static let identifier = "chatButtonCell"
    
    private let buttonImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "채팅 시작하기"
        label.font = Font.semibold(size: 24)
        label.textColor = .white
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let chatButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confitureCell() {
        guard let favoriteTeam = UserDefaults.standard.string(forKey: "favoriteTeam") else { return }
        self.buttonImage.image = UIImage(named: favoriteTeam)
        self.backgroundColor = UIColor(named: "c"+favoriteTeam)
    }
}

extension ChatButtonCell {
    private func setupView() {
        self.backgroundColor = .main
        self.layer.cornerRadius = self.frame.height * 0.1
        
        addSubview(buttonImage)
        buttonImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }
    
        addSubview(chatLabel)
        chatLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(buttonImage.snp.trailing).offset(10)
        }
        
        addSubview(arrowImage)
        arrowImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.height.equalTo(10)
        }
        
        addSubview(chatButton)
        chatButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
