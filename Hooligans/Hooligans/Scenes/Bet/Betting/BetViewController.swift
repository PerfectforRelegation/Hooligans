//
//  BetViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import UIKit

protocol BetDisplayLogic: AnyObject {
    
}

class BetViewController: UIViewController {
    
    private var teams: [String]?
    private var selectedTeam: Int = 0
    
    private let homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.cornerRadius(10)
        return button
    }()
    
    private let homeAllocationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let drawButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.cornerRadius(10)
        return button
    }()
    
    private let drawAllocationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let awayButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.cornerRadius(10)
        return button
    }()
    
    private let awayAllocationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let betButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("배팅하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    init(bet: Bet) {
        super.init(nibName: nil, bundle: nil)
        homeButton.setImage(UIImage(named: bet.home), for: .normal)
        homeAllocationLabel.text = String(bet.homeAllocation)
        awayButton.setImage(UIImage(named: bet.away), for: .normal)
        awayAllocationLabel.text = String(bet.awayAllocation)
        drawButton.setTitle("무승부", for: .normal)
        drawAllocationLabel.text = String(bet.drawAllocation)
        self.teams = [bet.home, "DRAW", bet.away]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

}

extension BetViewController {
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(homeButton)
        homeButton.addTarget(self, action: #selector(betHomeTeam), for: .touchUpInside)
        homeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview().offset(-70)
            make.width.height.equalTo(50)
        }
        view.addSubview(homeAllocationLabel)
        view.addSubview(drawButton)
        drawButton.addTarget(self, action: #selector(betDrawTeam), for: .touchUpInside)
        drawButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        view.addSubview(awayButton)
        awayButton.addTarget(self, action: #selector(betAwayTeam), for: .touchUpInside)
        awayButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview().offset(70)
            make.width.height.equalTo(50)
        }
        view.addSubview(betButton)
        betButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
    }
    
    @objc func betHomeTeam() {
        selectedTeam = 0
        homeButton.backgroundColor = .link
        drawButton.backgroundColor = .systemGray6
        awayButton.backgroundColor = .systemGray6
    }
    
    @objc func betDrawTeam() {
        selectedTeam = 1
        homeButton.backgroundColor = .systemGray6
        drawButton.backgroundColor = .link
        awayButton.backgroundColor = .systemGray6
    }
    
    @objc func betAwayTeam() {
        selectedTeam = 2
        homeButton.backgroundColor = .systemGray6
        drawButton.backgroundColor = .systemGray6
        awayButton.backgroundColor = .link
    }
    
    @objc func bettingButton() {
        
    }
}

extension BetViewController: BetDisplayLogic {
    
}
