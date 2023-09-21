
import UIKit

class SigninView: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var emailErrorLabel: UILabel!

    @IBOutlet weak var passwordErrorLabel: UILabel!

    var emailerrorheight: NSLayoutConstraint!
    var passworderrorheight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()



        // Textfield 값이 변경되는 것을 캐치하는 게 없음.

        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: UIControl.Event.editingChanged)

        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)

        emailerrorheight = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        passworderrorheight = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 0)

    }

    // #selector에서 @objc 가 없으면 호환이 안돼서 붙여줘야함
    @objc func textFieldEdited(textField: UITextField) {

        if textField == emailTextField{
            if isValidEmail(testStr: textField.text)
            {
                emailerrorheight.isActive = true
            }
            else{
                emailerrorheight.isActive = false
            }
        }
        else if textField == passwordTextField{
            if isValidPassword(pw: textField.text)
            {
                passworderrorheight.isActive = true
            }
            else{
                passworderrorheight.isActive = false
            }
        }

        UIView.animate(withDuration: 0.1) { // 효과 주기
            self.view.layoutIfNeeded()
        }
    }

    // 정규식
    func isValidEmail(testStr: String?) -> Bool {

          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailTest.evaluate(with: testStr)
           }

    func isValidPassword(pw: String?) -> Bool{
        if let hasPassword = pw{
            if hasPassword.count < 8{
                return false
            }
        }

        return true
    }
}
//
//class SigninView: UITableViewCell {
//    static let identifier = "SigninView"
//
//    var label: UILabel = {
//        var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.frame = CGRect(origin: .zero, size: .zero)
//        label.textColor = .black
//        return label
//    }()
//
//    var date: UILabel = {
//        var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.frame = CGRect(origin: .zero, size: .zero)
//        return label
//    }()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setupView()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        setupView()
//        // Configure the view for the selected state
//    }
//
//}
//
//extension SigninView {
//    private func setupView() {
//
//        addSubview(label)
//
//        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
//
//        addSubview(date)
//
//        date.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        date.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
//    }
//}
