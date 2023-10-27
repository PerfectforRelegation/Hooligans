import UIKit

class SignupView: UIView {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .gray
        label.textAlignment = .center
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

        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        self.addSubview(nicknameField)
        nicknameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nicknameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nicknameField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nicknameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nicknameField.heightAnchor.constraint(equalToConstant: 40)
        ])

        self.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: nicknameField.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
