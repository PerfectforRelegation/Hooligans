import UIKit
import SnapKit

class NicknameView: UIView {

    var previousEmail: String?
    var previousPassword: String?
    var previousPhoneNumber: String?

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

        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(self).offset(20)
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(100)
            make.leading.trailing.equalTo(self)
        }

        addSubview(nicknameField)
        nicknameField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(50)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }

        addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.leading.equalTo(self).offset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-40)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    @objc private func backButtonTapped() {
        guard let phonenumberView = PhonenumberView(frame: frame) as? PhonenumberView else { return }
        phonenumberView.emailTextField.text = previousEmail
        phonenumberView.passwordTextField.text = previousPassword
        phonenumberView.phoneNumberField.text = previousPhoneNumber

        superview?.addSubview(phonenumberView)
        removeFromSuperview()
    }

    @objc private func nextButtonTapped() {
        if let nickname = nicknameField.text, !nickname.isEmpty {
            let selectTeamView = SelectTeamView(frame: frame)
            selectTeamView.previousEmail = previousEmail
            selectTeamView.previousPassword = previousPassword
            selectTeamView.previousPhoneNumber = previousPhoneNumber
            selectTeamView.previousNickname = nickname

            subviews.forEach { $0.removeFromSuperview() }
            addSubview(selectTeamView)
        } else {
            print("닉네임을 입력해주세요.")
        }
    }
}
