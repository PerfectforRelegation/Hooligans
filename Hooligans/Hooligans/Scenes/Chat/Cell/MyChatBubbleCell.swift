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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        // Configure the view for the selected state
    }
    
}

extension MyChatBubbleCell {
    private func setupView() {
        self.addSubview(chatRoomLabel)
        
        chatRoomLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
