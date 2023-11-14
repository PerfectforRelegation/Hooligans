//
//  MyBetCell.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import UIKit

class MyBetCell: UITableViewCell {
    static let identifier = "myBetCell"
    
    private let pickLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let betPointLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let recieveLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let getButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.backgroundColor = .gray
        button.isEnabled = false
        button.layer.cornerRadius = 10
        return button
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
    
    func configureCell(userBet: UserBet) {
        pickLabel.text = userBet.point.pick
        betPointLabel.text = "BetPoint: \(String(userBet.point.betPoint))"
        recieveLabel.text = "Recieve Point: \(String(Int(Double(userBet.point.betPoint)*userBet.awayAllocation)))"
        if !userBet.point.result {
            getButton.isEnabled = true
            getButton.backgroundColor = .systemIndigo
        }
    }

}

extension MyBetCell {
    private func setupView() {
        addSubview(pickLabel)
        pickLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
        }
        addSubview(betPointLabel)
        betPointLabel.snp.makeConstraints { make in
            make.top.equalTo(pickLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        addSubview(recieveLabel)
        recieveLabel.snp.makeConstraints { make in
            make.top.equalTo(betPointLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            
        }
        contentView.addSubview(getButton)
        getButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(50)
            make.height.equalTo(70)
        }
    }
}
