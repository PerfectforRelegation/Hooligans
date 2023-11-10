//
//  TeamChatRoomCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import UIKit

final class TeamChatRoomCell: UICollectionViewCell {
    static let identifier = "teamChatRoomCell"
    
    private let homeTeamImage = UIImageView()
        .opacity(0.5)
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.bold(size: 32)
        label.textColor = .white
        return label
    }()
    
    private let userCountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configureCell(chatRoom: ChatRoom) {
        homeTeamImage.image = UIImage(named: chatRoom.name)
        teamNameLabel.text = chatRoom.name
        self.backgroundColor = UIColor(named: "c"+chatRoom.name)
    }
}

extension TeamChatRoomCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = frameHeight * 0.2
        
        self.addSubview(homeTeamImage)
        homeTeamImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.leading).offset(frameHeight * 0.25)
            make.width.height.equalTo(frameHeight * 0.8)
        }
        
        self.addSubview(teamNameLabel)
        teamNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(100)
        }
        
        self.addSubview(userCountLabel)
        userCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
