
import UIKit

class TextField: UITextField {

    var label: UILabel!

    enum TextFieldType {
        case username
        case email
        case password
    }

    private let authFieldType: TextFieldType

    init(fieldType: TextFieldType) {
        
        self.authFieldType = fieldType
        super.init(frame: .zero)

        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1

        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none

        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))

        self.label = UILabel(frame: CGRectZero)
        self.label.backgroundColor = UIColor.clear
        self.label.textColor = UIColor(red: 253.0 / 255.0, green: 224.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
        self.label.text = self.placeholder
        self.label.font = UIFont.systemFont(ofSize: 10.0)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.alpha = 0.0

        self.addSubview(self.label)
        

        switch fieldType {
            

        case .username:
            self.placeholder = "사용자 이름"

        case .email:
            self.placeholder = "이메일"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress

        case .password:
            self.placeholder = "비밀번호"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true


        }
        
        // 이메일 유효성 검사
        if fieldType == .email {
            self.addTarget(self, action: #selector(validateEmail), for: .editingChanged)
        }
        
        // 비밀번호 유효성 검사
        if fieldType == .password {
            self.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        }

        // placeholder 색상 변경
        if let placeholderText = self.placeholder {
            let placeholderColor = UIColor(red: 0.2078, green: 0.3529, blue: 0.4667, alpha: 1.0)
            let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor]
            let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
            self.attributedPlaceholder = attributedPlaceholder

        }

        
        func awakeFromNib() {

            self.label = UILabel(frame: CGRectZero)
            self.label.backgroundColor = UIColor.clear
            self.label.textColor = UIColor(red: 253.0 / 255.0, green: 224.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
            self.label.text = self.placeholder
            self.label.font = UIFont.systemFont(ofSize: 10.0)
            self.label.translatesAutoresizingMaskIntoConstraints = false
            self.label.alpha = 0.0

            self.addSubview(self.label)

//            // 생성 및 설정
//            self.label = UILabel()
//            self.label.text = self.placeholder
//            self.label.font = UIFont.systemFont(ofSize: 10.0)
//            self.label.textColor = UIColor(red: 253.0 / 255.0, green: 224.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
//            self.label.translatesAutoresizingMaskIntoConstraints = false
//            self.label.alpha = 0.0
//
//            self.addSubview(self.label)


            // 상단과 부모 뷰의 상단을 일치시키는 제약 조건
            let topConstraint = self.label.topAnchor.constraint(equalTo: self.topAnchor)

            // 폭과 부모 뷰의 폭을 일치시키는 제약 조건
            let widthConstraint = self.label.widthAnchor.constraint(equalTo: self.widthAnchor)

            // 높이를 50으로 설정하는 제약 조건
            let heightConstraint = self.label.heightAnchor.constraint(equalToConstant: 50.0)

            // leading과 부모 뷰의 leading을 5로 설정하는 제약 조건
            let leadingConstraint = self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0)

            // 생성한 제약 조건들을 활성화
            NSLayoutConstraint.activate([topConstraint, widthConstraint, heightConstraint, leadingConstraint])

        }
    }

        // status에 따라 animation 적용하기
        func changeStatus(status: TextFieldType) {

            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in

                switch status   {
                case .username:
                    self.label.alpha = 0.0
                    self.label.transform = CGAffineTransformIdentity
                    break
                case .password:
                    self.label.alpha = 1.0
                    self.label.transform = CGAffineTransformMakeTranslation(0.0, -14.0)
                    break

                case .email:
                    self.label.alpha = 1.0
                    break
                }

            }) { (finish) -> Void in

            }
        }



    // placeholder 위치 조정
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            return CGRectMake(CGRectGetMinX(bounds) + 5.0, CGRectGetMinY(bounds) + 10.0, CGRectGetWidth(bounds) - 20.0, CGRectGetHeight(bounds))
            }

    // text 위치 조정
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return CGRectMake(CGRectGetMinX(bounds) + 5.0, CGRectGetMinY(bounds) + 8.0, CGRectGetWidth(bounds) - 20.0, CGRectGetHeight(bounds))
            }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // 이메일 유효성 검사
    @objc func validateEmail() {
        if let email = self.text {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,}"
            if NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
                self.layer.borderColor = UIColor.blue.cgColor
            } else {
                self.layer.borderColor = UIColor.red.cgColor
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

