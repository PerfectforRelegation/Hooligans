import UIKit
import SnapKit

class PhonenumberView: UIView, UITextFieldDelegate {
    //var previousNickname: String?
    //var selectedTeam: (name: String, imageName: String)?

    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("뒤로", for: .normal)
        return button
    }()

    let RegisterLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디(이메일)"
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        return textField
    }()

    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 확인"
        textField.isSecureTextEntry = true
        return textField
    }()

    let phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "휴대폰 번호"
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
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        phoneNumberField.delegate = self
        phoneNumberField.keyboardType = .numberPad
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

        self.addSubview(RegisterLabel)
        RegisterLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self)
        }

        self.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(RegisterLabel.snp.bottom).offset(50)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }

        self.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(50)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }

        self.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }

        self.addSubview(phoneNumberField)
        phoneNumberField.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(50)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }

        self.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.leading.equalTo(self).offset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-40)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

        self.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.leading.equalTo(self).offset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(nextButton.snp.top).offset(-20)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomLine(to: emailTextField)
        addBottomLine(to: passwordTextField)
        addBottomLine(to: confirmPasswordTextField)
        addBottomLine(to: phoneNumberField)
    }

    private func addBottomLine(to textField: UITextField) {
        let bottomLine = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: textField.bounds.size.height - 1))
        path.addLine(to: CGPoint(x: textField.bounds.size.width, y: textField.bounds.size.height - 1))
        bottomLine.path = path.cgPath
        bottomLine.strokeColor = UIColor.lightGray.cgColor
        textField.layer.addSublayer(bottomLine)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        setBottomLineColor(of: textField, to: .systemIndigo)
        setBottomLineProperties(of: textField, with: 1.2)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        setBottomLineColor(of: textField, to: .systemGray5)
    }
    
    func setBottomLineProperties(of textField: UITextField, with thickness: CGFloat) {
        if let bottomLine = textField.layer.sublayers?.first as? CAShapeLayer {
            bottomLine.lineWidth = thickness
        }
    }

    private func setBottomLineColor(of textField: UITextField, to color: UIColor) {
        if let bottomLine = textField.layer.sublayers?.first as? CAShapeLayer {
            bottomLine.strokeColor = color.cgColor
        }
    }


    private func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    private func validatePassword(_ password: String) -> Bool {
        // 비밀번호 8자 이상, 숫자 및 문자를 포함하는지 확인
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }

    private func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^010[0-9]{8}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return phonePredicate.evaluate(with: phoneNumber)
    }

    @objc private func backButtonTapped() {
        let signinController = SigninController()
        UIApplication.shared.keyWindow?.rootViewController = signinController
    }

    @objc private func nextButtonTapped() {
        guard let email = emailTextField.text, validateEmail(email) else {
            print("유효한 이메일 형식이 아닙니다. 올바른 이메일을 입력해주세요.")
            return
        }
        guard let password = passwordTextField.text, validatePassword(password) else {
            print("비밀번호는 최소 8자 이상이어야 하며, 숫자와 문자를 포함해야 합니다.")
            return
        }
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            print("비밀번호를 확인해주세요.")
            return
        }
        guard password == confirmPassword else {
            print("비밀번호가 일치하지 않습니다.")
            return
        }
        guard let phoneNumber = phoneNumberField.text, validatePhoneNumber(phoneNumber) else {
            print("형식에 맞게 입력해주세요.")
            return
        }

        let nicknameView = NicknameView(frame: self.frame)
        nicknameView.previousEmail = email
        nicknameView.previousPassword = password
        nicknameView.previousPhoneNumber = phoneNumber

        self.subviews.forEach { $0.removeFromSuperview() }
        self.addSubview(nicknameView)
    }
}
