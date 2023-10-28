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
        return label
    }()

    let phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "전화번호 입력"
        textField.borderStyle = .roundedRect
        return textField
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
            phoneNumberField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            phoneNumberField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            phoneNumberField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            phoneNumberField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func backButtonTapped() {
        guard let selectTeamView = SelectTeamView(frame: self.frame) as? SelectTeamView else { return }
        selectTeamView.previousNickname = previousNickname

        self.superview?.addSubview(selectTeamView)
        self.removeFromSuperview()
    }
}
