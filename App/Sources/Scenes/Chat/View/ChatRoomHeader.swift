//
//  ChatRoomHeader.swift
//  Hooligans
//
//  Created by 정명곤 on 11/10/23.
//

import UIKit

final class ChatRoomHeader: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let roomLabel: UILabel = {
        let label = UILabel()
//        label.font = Font.regular(size: 18)
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(chatRoom: ChatRoom) {
        roomLabel.text = chatRoom.name
        self.backgroundColor = UIColor(named: "c"+chatRoom.name)
    }
    
}

extension ChatRoomHeader {
    private func setupView() {
        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        addSubview(roomLabel)
        roomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
