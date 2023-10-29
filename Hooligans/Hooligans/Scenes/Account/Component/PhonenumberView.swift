import UIKit

class PhonenumberView: UIView {

    var previousNickname: String?
    var selectedTeam: String?

    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("뒤로", for: .normal)
        return button
    }()

    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "핸드폰 번호를 입력해주세요"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ex) 01012345678"
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
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        self.addSubview(phoneNumberLabel)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        self.addSubview(phoneNumberField)
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 50),
            phoneNumberField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            phoneNumberField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            phoneNumberField.heightAnchor.constraint(equalToConstant: 40)
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
        guard let selectTeamView = SelectTeamView(frame: self.frame) as? SelectTeamView else { return }
        selectTeamView.previousNickname = previousNickname
        selectTeamView.selectedTeam = selectedTeam

        self.superview?.addSubview(selectTeamView)
        self.removeFromSuperview()
    }

    @objc private func nextButtonTapped() {

    }
}
