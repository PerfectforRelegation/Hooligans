//
//  BetViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import UIKit

protocol BetDisplayLogic: AnyObject {
    func displayComplete()
}

class BetViewController: UIViewController {
    var interactor: (BetBusinessLogic&BetDataStore)?

    private var id: String?
    private var teams: [String]?
    private var selectedTeam: Int = 0

    private let completeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "원하는 곳에 배팅해주세요"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

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
        textField.keyboardType = .numberPad
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "최소 1000이상", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        let underline = UIView()
        underline.backgroundColor = .systemGray
        textField.addSubview(underline)
        underline.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1.2)
        }
        textField.borderStyle = .none
//        textField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
//        textField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)

        return textField
    }()

    private let betButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("배팅하기", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    init(bet: Bet) {
        super.init(nibName: nil, bundle: nil)
        self.id = bet.id.uuidString
        homeButton.setImage(UIImage(named: bet.home), for: .normal)
        homeAllocationLabel.text = String(bet.homeAllocation)
        awayButton.setImage(UIImage(named: bet.away), for: .normal)
        awayAllocationLabel.text = String(bet.awayAllocation)
        drawButton.setTitle("무승부", for: .normal)
        drawAllocationLabel.text = String(bet.drawAllocation)
        self.teams = [bet.home, "DRAW", bet.away]
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = BetInteractor()
        let presenter = BetPresenter()
//        let router = MainRouter()
        viewController.interactor = interactor
//        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
//        router.viewController = viewController
//        router.dataStore = interactor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.

        if let backButtonImage = UIImage(systemName: "chevron.backward") {
            let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backAction))
            backButton.tintColor = .black
            navigationItem.leftBarButtonItem = backButton
        }
    }

}

extension BetViewController {
    private func setupView() {
        view.backgroundColor = .white

        view.addSubview(instructionLabel)
        instructionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.centerX.equalToSuperview()
        }

        view.addSubview(homeButton)
        homeButton.addTarget(self, action: #selector(betHomeTeam), for: .touchUpInside)
        homeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview().offset(-120)
            make.width.height.equalTo(100)
        }
        view.addSubview(homeAllocationLabel)
        view.addSubview(drawButton)
        drawButton.addTarget(self, action: #selector(betDrawTeam), for: .touchUpInside)
        drawButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        view.addSubview(awayButton)
        awayButton.addTarget(self, action: #selector(betAwayTeam), for: .touchUpInside)
        awayButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview().offset(120)
            make.width.height.equalTo(100)
        }
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(30)
            make.width.equalTo(330)
            make.height.equalTo(80)
        }

        view.addSubview(betButton)
        betButton.addTarget(self, action: #selector(bettingButton), for: .touchUpInside)
        betButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
            make.height.equalTo(50)
        }
        view.addSubview(completeLabel)
        completeLabel.snp.makeConstraints { make in
            make.top.equalTo(betButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }

    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }

    @objc func betHomeTeam() {
        selectedTeam = 0
        homeButton.layer.borderColor = UIColor.systemIndigo.cgColor
        homeButton.layer.borderWidth = 2.0

        drawButton.layer.borderColor = UIColor.systemGray6.cgColor
        drawButton.layer.borderWidth = 0.0

        awayButton.layer.borderColor = UIColor.systemGray6.cgColor
        awayButton.layer.borderWidth = 0.0
    }

    @objc func betDrawTeam() {
        selectedTeam = 1
        homeButton.layer.borderColor = UIColor.systemGray6.cgColor
        homeButton.layer.borderWidth = 0.0

        drawButton.layer.borderColor = UIColor.systemIndigo.cgColor
        drawButton.layer.borderWidth = 2.0

        awayButton.layer.borderColor = UIColor.systemGray6.cgColor
        awayButton.layer.borderWidth = 0.0
    }

    @objc func betAwayTeam() {
        selectedTeam = 2
        homeButton.layer.borderColor = UIColor.systemGray6.cgColor
        homeButton.layer.borderWidth = 0.0

        drawButton.layer.borderColor = UIColor.systemGray6.cgColor
        drawButton.layer.borderWidth = 0.0

        awayButton.layer.borderColor = UIColor.systemIndigo.cgColor
        awayButton.layer.borderWidth = 2.0
    }

//    @objc private func textFieldDidBeginEditing() {
//        if let underline = textField.subviews.first(where: { $0 is UIView }) {
//            underline.backgroundColor = .systemIndigo
//        }
//    }
//
//    @objc private func textFieldDidEndEditing() {
//        if let underline = textField.subviews.first(where: { $0 is UIView }) {
//            underline.backgroundColor = .systemGray
//        }
//    }

    @objc func bettingButton() {
        print(id, teams, selectedTeam, textField.text)
        if let id = id, let pick = teams?[selectedTeam], let text = textField.text {
            interactor?.betting(request: BetModels.Betting.Request(id: id, betPoint: Int(text)!, pick: pick))
        }
    }
}

extension BetViewController: BetDisplayLogic {
    func displayComplete() {
        DispatchQueue.main.async {
            self.completeLabel.text = "배팅 성공!"
        }
    }
}
