//
//  BetResultCell.swift
//  Hooligans
//
//  Created by 정명곤 on 11/9/23.
//

import UIKit

class BetResultCell: UICollectionViewCell {
    static let identifier = "betResultCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회수할 포인트"
        label.font = Font.medium(size: 16)
        label.textColor = .systemIndigo
        return label
    }()
    
    private let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private let divideLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let pointLabel: UILabel = {
        let label = UILabel()
        label.font = Font.medium(size: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configureCell(betResult: BetResult) {
        self.pointLabel.text = String(betResult.point)
    }
}

extension BetResultCell {
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = self.frame.height * 0.1
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowPath = nil
        
        addSubview(chevronImage)
        chevronImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(15)
            make.width.height.equalTo(15)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(chevronImage.snp.centerY)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalTo(chevronImage.snp.leading).inset(10)
        }
        
        addSubview(divideLine)
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(1)
        }
        
        addSubview(pointLabel)
        pointLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
        }
    }
}
