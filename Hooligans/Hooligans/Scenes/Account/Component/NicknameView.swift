import UIKit

class NicknameView: UIView {

    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("뒤로", for: .normal)
        return button
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 정해주세요"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let nicknameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "@첼시는강등이딱이야"
        textField.borderStyle = .roundedRect
        return textField
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        self.backgroundColor = .white

        self.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(self).offset(20)
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        self.addSubview(nicknameField)
        nicknameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nicknameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            nicknameField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nicknameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nicknameField.heightAnchor.constraint(equalToConstant: 40)
        ])

        self.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    @objc private func backButtonTapped() {
        let signinController = SigninController()
        let navController = UINavigationController(rootViewController: signinController)
        //self.present(navController, animated: true, completion: nil)
    }

    @objc private func nextButtonTapped() {
        if let nickname = nicknameField.text, !nickname.isEmpty {
            let selectTeamView = SelectTeamView(frame: self.frame)
            selectTeamView.previousNickname = nickname

            self.subviews.forEach { $0.removeFromSuperview() }
            self.addSubview(selectTeamView)
        } else {
            print("닉네임을 입력해주세요.")
        }
    }
}

