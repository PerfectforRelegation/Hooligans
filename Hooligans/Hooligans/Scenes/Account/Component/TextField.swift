
import UIKit

enum TextFieldStatus: Int {
    case Normal
    case Input
}

class TextField: UITextField {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.2078, green: 0.3529, blue: 0.4667, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        return label
    }()
    
    
    
    enum TextFieldType {
        case email
        case password
    }
    
    private let authFieldType: TextFieldType
    
    init(fieldType: TextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        switch fieldType {
        case .email:
            self.placeholder = "이메일"
            self.label.text = self.placeholder
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "비밀번호"
            self.label.text = self.placeholder
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
        
        setupView()
        
        
        // 이메일 유효성 검사
//        if fieldType == .email {
//            self.addTarget(self, action: #selector(validateEmail), for: .editingChanged)
//        }
        
        // 비밀번호 유효성 검사
        if fieldType == .password {
            self.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 이메일 유효성 검사
    @objc func changePlacholder() {
        if let email = self.text {
            
        }
        if let email = self.text {
            UIView.animate(withDuration: 0.3) {
                if email.count == 0 {
                    self.label.alpha = 0
                    self.label.transform = CGAffineTransform(translationX: 0, y: -10)
                } else {
                    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,}"
                    self.label.alpha = 1
                    self.label.transform = CGAffineTransform(translationX: 0, y: -40)
                    
                    if NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
                        self.layer.borderColor = UIColor.blue.cgColor
                    } else {
                        self.layer.borderColor = UIColor.red.cgColor
                    }
                }
            }
        }
    }
    
    // 비밀번호 유효성 검사
    @objc func validatePassword() {
        if let password = self.text {
            if password.count >= 8 {
                self.layer.borderColor = UIColor.blue.cgColor
            } else {
                self.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
}

extension TextField {
    private func setupView() {
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
//        self.backgroundColor = .systemGray6
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        self.addTarget(self, action: #selector(changePlacholder), for: .editingChanged)
        
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview()
        }
    }
    
    func changeStatus(status: TextFieldStatus) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            switch status {
            case .Normal:
                self.label.alpha = 0.0
                self.changeView()
                break
            case .Input:
                self.label.alpha = 1.0
                self.label.transform = CGAffineTransformMakeTranslation(0.0, -14.0)
                break
            }
            
        })
    }
    
    private func changeView() {
        label.snp.remakeConstraints { make in
            make.top.equalToSuperview()
        }
    }
}

