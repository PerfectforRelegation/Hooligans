//
//  FixtureCell.swift
//  Hooligans
//
//  Created by 정명곤 on 10/18/23.
//

import UIKit

final class FixtureCell: UICollectionViewCell {
    static let identifier = "fixtureCell"
    
    // MARK: - View Initialize
    private let homeTeamImage = UIImageView()
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
    
    private let awayTeamImage = UIImageView()
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
    
    private let timeLable: UILabel = {
        let label = UILabel()
//        label.font = Font.semibold(size: 20)
        label.textColor = .white
        return label
    }()
    
    private let stadiumLabel: UILabel = {
        let label = UILabel()
//        label.font = Font.semibold(size: 10)
        label.textColor = .white
        return label
    }()

    
    // MARK: - Init Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configureCell(fixture: Fixture) {
        homeTeamImage.image = UIImage(named: fixture.home)
        awayTeamImage.image = UIImage(named: fixture.away)
        timeLable.text = fixture.time
        stadiumLabel.text = fixture.stadium
    }
    
}

extension FixtureCell {
    private func setupView() {
        let frameHeight = self.frame.height
        self.backgroundColor = .epl?.withAlphaComponent(0.8)
        self.layer.cornerRadius = frameHeight * 0.2
        
        addSubview(timeLable)
        timeLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(stadiumLabel)
        stadiumLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
        }
        
        self.addSubview(homeTeamImage)
        homeTeamImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.leading)
            make.width.height.equalTo(frameHeight * 1.5)
        }
        
        self.addSubview(awayTeamImage)
        awayTeamImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.trailing)
            make.width.height.equalTo(frameHeight * 1.5)
        }
        
    }
    
    func configure(home: String, away: String) {
        homeTeamImage.image = UIImage(named: home)
        awayTeamImage.image = UIImage(named: away)
    }
}
