//
//  MyChatBubbleCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/27/23.
//

import UIKit

class MyChatBubbleCell: UITableViewCell {
    static let identifier = "myChatBubbleCell"
   
    var chatRoomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        label.text = "room1"
        label.backgroundColor = .gray
        label.layer.cornerRadius = 10
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
//        let inset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
//        let bubbleView = UIView()
//        bubbleView.backgroundColor = .yellow
//        bubbleView.layer.cornerRadius = 10
//        contentView.addSubview(bubbleView)
//
//        bubbleView.snp.makeConstraints { make in
//            make.top.equalTo(contentView).inset(inset.top)
//            make.leading.equalTo(contentView).inset(inset.left)
//            make.bottom.equalTo(contentView).inset(inset.bottom)
//        }
//
//        bubbleView.addSubview(chatRoomLabel)
//
//        chatRoomLabel.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalTo(10)
//            make.trailing.lessThanOrEqualToSuperview().inset(inset.right)
//        }
//    }
        let inset = UIEdgeInsets(top: 25, left: 10, bottom: 25, right: 10)
        let bubbleView = UIView()
        bubbleView.backgroundColor = .white
        bubbleView.layer.cornerRadius = 10
        contentView.addSubview(bubbleView)

        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(inset.left)
            make.top.equalTo(contentView).offset(5)
            make.width.height.equalTo(30)
        }

        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "사용자 이름"
        userNameLabel.font = UIFont.systemFont(ofSize: 12)
        userNameLabel.textColor = .white

        bubbleView.addSubview(userNameLabel)

        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
        }

        bubbleView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(inset.top)
            make.bottom.equalTo(contentView).offset(-15)
            make.leading.equalTo(50)
        }

        bubbleView.addSubview(chatRoomLabel)

        chatRoomLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(10)
            make.trailing.lessThanOrEqualToSuperview().inset(inset.right)
        }
    }
}

extension MyChatBubbleCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = UIColor(red: 0.2549, green: 0.2706, blue: 0.3176, alpha: 1.0)
        self.layer.cornerRadius = frameHeight * 0.2
    }
}
