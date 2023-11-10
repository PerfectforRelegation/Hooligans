//
//  BetListCell.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import UIKit
import SnapKit

class BetListCell: UITableViewCell {
    static let identifier = "betListCell"
    
    private var homeTemaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var awayTemaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var homeAllocationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var awayAllocationLabel: UILabel = {
        let label = UILabel()
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
    
    func configureCell(bet: Bet) {
        self.homeTemaLabel.text = bet.home
        self.awayTemaLabel.text = bet.away
        self.homeAllocationLabel.text = String(bet.homeAllocation)
        self.awayAllocationLabel.text = String(bet.awayAllocation)
    }

}

extension BetListCell {
    private func setupView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 20
        
        self.addSubview(homeTemaLabel)
        homeTemaLabel.font = UIFont.boldSystemFont(ofSize: 16)
        homeTemaLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.width.equalTo(50)
        }
        self.addSubview(awayTemaLabel)
        awayTemaLabel.font = UIFont.boldSystemFont(ofSize: 16)
        awayTemaLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.width.equalTo(50)
        }
        self.addSubview(homeAllocationLabel)
        homeAllocationLabel.snp.makeConstraints { make in
            make.top.equalTo(awayTemaLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(50)
        }
        self.addSubview(awayAllocationLabel)
        awayAllocationLabel.snp.makeConstraints { make in
            make.top.equalTo(awayTemaLabel.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(50)
        }
    }
}
