//
//  ChatCollectionViewHeader.swift
//  Hooligans
//
//  Created by 정명곤 on 10/22/23.
//

import UIKit

final class ChatCollectionViewHeader: UICollectionReusableView {
    static let identifier = "homeCollectionViewHeader"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.frame = CGRect(origin: .zero, size: .zero)
        return stackView
    }()
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
}

extension ChatCollectionViewHeader {
    private func setupView() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        
    }
}
