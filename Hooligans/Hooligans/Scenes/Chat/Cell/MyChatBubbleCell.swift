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
        let inset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        let bubbleView = UIView()
        bubbleView.backgroundColor = .yellow
        bubbleView.layer.cornerRadius = 10
        contentView.addSubview(bubbleView)

        bubbleView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(inset.top)
            make.leading.equalTo(contentView).inset(inset.left)
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

extension MyChatBubbleCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = UIColor(red: 0.2549, green: 0.2706, blue: 0.3176, alpha: 1.0)
        self.layer.cornerRadius = frameHeight * 0.2
    }
}
