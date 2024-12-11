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
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .black

        //        imageView.layer.cornerRadius = 10
        //        imageView.layer.borderWidth = 1.0
        //        imageView.layer.borderColor = UIColor.black.cgColor
        //        imageView.clipsToBounds = true
        return imageView
    }()

    let bubbleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 12
        return view
    }()

    let userNameLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont.systemFont(ofSize: 12)
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .black
        return label
    }()

    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        //label.font = UIFont.boldSystemFont(ofSize: 16)
      label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
    }

    func configureCell() {

    }
    
    private func setupView() {
        let frameHeight = self.frame.height
        //self.layer.cornerRadius = frameHeight * 0.2

        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }

        contentView.addSubview(bubbleView)
        bubbleView.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }

        bubbleView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }

        bubbleView.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(4)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }

        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(bubbleView.snp.bottom).offset(10)
        }
    }
}

