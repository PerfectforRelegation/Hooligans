////
////  UserBetCell.swift
////  Hooligans
////
////  Created by 정명곤 on 11/2/23.
////
//
//import UIKit
//
//final class UserBetCell: UICollectionViewCell {
//    static let identifier = "userBetCell"
//    
//    
//    // MARK: - View Initialize
//    private let button: UIButton = {
//        let button = UIButton()
//        
//    }
//    
//    
//    // MARK: - Init Method
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupView()
//    }
//    
//    func configureCell() {
//        homeTeamImage.image = UIImage(named: fixture.home)
//        awayTeamImage.image = UIImage(named: fixture.away)
//    }
//    
//}
//
//extension UserbetCell {
//    private func setupView() {
//        let frameHeight = self.frame.height
//        self.backgroundColor = .lightGray
//        self.layer.cornerRadius = frameHeight * 0.2
//        
//        self.addSubview(homeTeamImage)
//        homeTeamImage.snp.makeConstraints { make in
//            make.centerY.equalTo(self.snp.centerY)
//            make.centerX.equalTo(self.snp.leading).offset(frameHeight * 0.25)
//            make.width.height.equalTo(frameHeight * 0.8)
//        }
//        
//        self.addSubview(awayTeamImage)
//        awayTeamImage.snp.makeConstraints { make in
//            make.centerY.equalTo(self.snp.centerY)
//            make.centerX.equalTo(self.snp.trailing).inset(frameHeight * 0.25)
//            make.width.height.equalTo(frameHeight * 0.8)
//        }
//        
//    }
//    
//    func configure(home: String, away: String) {
//        homeTeamImage.image = UIImage(named: home)
//        awayTeamImage.image = UIImage(named: away)
//    }
//}
