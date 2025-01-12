//
//  TeamChatRoomCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import UIKit
import Domain

final class TeamChatRoomCell: UICollectionViewCell {
    static let identifier = "teamChatRoomCell"

    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
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

    }
}

extension TeamChatRoomCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = frameHeight * 0.2


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
