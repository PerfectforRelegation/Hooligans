//
//  TestTableViewCell.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/15.
//

import UIKit
import SnapKit

class LeagueTableViewCell: UITableViewCell {
    static let identifier = "leagueTableViewCell"
    
    var rankLabel: UILabel = {
        var label = UILabel()
//        label.font = Font.semibold(size: 18)
        label.textColor = .black
        return label
    }()
    
    var teamLogoImageView: UIImageView = {
        var imageView = UIImageView()
        
        return imageView
    }()
    
    var teamNameLabel: UILabel = {
        var label = UILabel()
//        label.font = Font.medium(size: 18)
        label.textColor = .black
        return label
    }()
    
    var playedLabel: UILabel = {
        var label = UILabel()
//        label.font = Font.regular(size: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var wonLabel: UILabel = {
        var label = UILabel()
//        label.font = Font.regular(size: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var drawnLabel: UILabel = {
        var label = UILabel()
//        label.font = Font.regular(size: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var lostLabel: UILabel = {
        var label = UILabel()
//        label.font = Font.regular(size: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var pointsLabel: UILabel = {
        var label = UILabel()
//        label.font = Font.regular(size: 16)
        label.textAlignment = .center
        label.textColor = .black
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
    
    func configure(rank: Int, team: Team) {
        self.rankLabel.text = String(rank)
        self.teamLogoImageView.image = UIImage(named: team.teamId)
        self.teamNameLabel.text = team.teamId
        self.playedLabel.text = team.played
        self.wonLabel.text = team.won
        self.drawnLabel.text = team.drawn
        self.lostLabel.text = team.lost
        self.pointsLabel.text = team.points
    }
    
}

extension LeagueTableViewCell {
    private func setupView() {
        let frameHeight = self.frame.height
//        self.backgroundColor = .epl?.withAlphaComponent(0.8)
        self.layer.cornerRadius = frameHeight * 0.2
        
        addSubview(rankLabel)
        rankLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(35)
        }
        
        addSubview(teamLogoImageView)
        teamLogoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(rankLabel.snp.trailing).offset(10)
            make.width.height.equalTo(35)
        }
        
        addSubview(pointsLabel)
        pointsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(50)
        }
        
        addSubview(lostLabel)
        lostLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(pointsLabel.snp.leading).offset(-10)
            make.width.equalTo(20)
        }
        
        addSubview(drawnLabel)
        drawnLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(lostLabel.snp.leading).offset(-10)
            make.width.equalTo(20)
        }
        
        addSubview(wonLabel)
        wonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(drawnLabel.snp.leading).offset(-10)
            make.width.equalTo(20)
        }
        
        addSubview(playedLabel)
        playedLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(wonLabel.snp.leading).offset(-10)
            make.width.equalTo(20)
        }
        
        addSubview(teamNameLabel)
        teamNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(teamLogoImageView.snp.trailing).offset(5)
            make.trailing.equalTo(playedLabel.snp.leading).inset(5)
        }
        
    }
}
