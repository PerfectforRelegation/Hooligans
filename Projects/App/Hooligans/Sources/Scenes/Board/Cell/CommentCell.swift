//
//  CommentCell.swift
//  Hooligans
//
//  Created by 정명곤 on 11/11/23.
//

import UIKit

final class CommentCell: UITableViewCell {
    static let identifier = "commentCell"
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.medium(size: 16)
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular(size: 14)
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
    
    func configureCell(comment: Comment) {
        nicknameLabel.text = comment.nickname
        commentLabel.text = comment.comment
    }

}

extension CommentCell {
    private func setupView() {
        addSubview(nicknameLabel)
        nicknameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        
        addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.bottom.equalToSuperview().inset(15)
        }
    }
}
