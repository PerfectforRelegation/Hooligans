import UIKit

class SignupViewController: UIViewController {

    var nicknameView: NicknameView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nicknameView.nextButton.addTarget(self, action: #selector(clickNext), for: .touchUpInside)
    }

    override func loadView() {
        super.loadView()

        nicknameView = NicknameView(frame: self.view.frame)
        self.view = nicknameView
    }

    @objc private func clickNext() {
        if nicknameView.nicknameField.text != nil {

        }
    }
}
