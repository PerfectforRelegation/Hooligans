//
//  BoardDetailContentView.swift
//  Hooligans
//
//  Created by 정명곤 on 11/10/23.
//

import UIKit
import Domain


final class BoardDetailContentView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "123123123123123123"
//        label.font = Font.semibold(size: 18)
        return label
    }()
    
    private let contextLabel: UILabel = {
        let label = UILabel()
        label.text = "123123123123123123"
//        label.font = Font.regular(size: 16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(board: Board) {
//        titleLabel.text = board.title
//        contextLabel.text = board.content
    }
}

extension BoardDetailContentView {
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        
        addSubview(contextLabel)
        contextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
