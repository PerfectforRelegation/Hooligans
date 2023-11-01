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
        //label.textColor = .white
        return label
    }()
    
    var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "coin")
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setupSubviews()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        setupSubviews()
        // Configure the view for the selected state
    }

    private func setupSubviews() {
        let inset = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10)
        let bubbleView = UIView()
        bubbleView.backgroundColor = .white
        bubbleView.layer.cornerRadius = 10
        contentView.addSubview(bubbleView)

        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(inset.left)
            make.centerY.equalTo(bubbleView)
            make.width.height.equalTo(30)
        }

        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "사용자 이름"
        userNameLabel.font = UIFont.systemFont(ofSize: 12)
        userNameLabel.textColor = .gray

        bubbleView.addSubview(userNameLabel)

        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(8)
            make.trailing.lessThanOrEqualTo(contentView).inset(inset.right)
        }

        bubbleView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(inset.top)
            make.leading.equalTo(userImageView.snp.trailing).offset(8)
            make.bottom.equalTo(contentView).inset(inset.bottom)
        }

        bubbleView.addSubview(chatRoomLabel)

        chatRoomLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(10)
            make.trailing.lessThanOrEqualToSuperview().inset(inset.right)
        }
    }
}

extension ChatBubbleCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = UIColor(red: 0.2549, green: 0.2706, blue: 0.3176, alpha: 1.0)
        self.layer.cornerRadius = frameHeight * 0.2
    }
}
