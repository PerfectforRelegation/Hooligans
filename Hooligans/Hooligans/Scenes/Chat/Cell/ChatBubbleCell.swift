//
//  ChatBubbleCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import UIKit

class ChatBubbleCell: UITableViewCell {
    static let identifier = "ChatListTableViewCell"
   
    var chatRoomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        label.text = "room1"
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        // Configure the view for the selected state
    }
    
}

extension ChatBubbleCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = .systemOrange
        self.layer.cornerRadius = frameHeight * 0.2
        self.addSubview(chatRoomLabel)
        
        chatRoomLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
        }
    }
}
