//
//  ChatBubbleCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/25/23.
//

import UIKit

class ChatBubbleCell: UITableViewCell {
    static let identifier = "ChatListTableViewCell"

    var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "coin")
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = Font.medium(size: 16)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        // Configure the view for the selected state
    }
    
    func configureCell(message: Message) {
        self.userNameLabel.text = message.sender
        self.messageLabel.text = message.message
    }

}

extension ChatBubbleCell {
    private func setupView() {
        self.backgroundColor = .black
        let frameHeight = self.frame.height
        self.layer.cornerRadius = frameHeight * 0.2
        
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.height.equalTo(40)
        }

        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
        }
        
        addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
