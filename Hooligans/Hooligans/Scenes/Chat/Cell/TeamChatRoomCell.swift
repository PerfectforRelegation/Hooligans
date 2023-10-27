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
    }
}

extension TeamChatRoomCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = frameHeight * 0.2
        
        self.addSubview(homeTeamImage)
        homeTeamImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.leading).offset(frameHeight * 0.25)
            make.width.height.equalTo(frameHeight * 0.8)
        }
    }
}
