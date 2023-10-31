//import UIKit
//
//class SignupViewController: UIViewController {
//
//    var nicknameView: NicknameView!
//    var selectTeamView: SelectTeamView?
//    //var phonenumberView: PhonenumberView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        nicknameView.nextButton.addTarget(self, action: #selector(clickNext), for: .touchUpInside)
//    }
//
//    override func loadView() {
//        super.loadView()
//
//        nicknameView = NicknameView(frame: self.view.frame)
//        self.view = nicknameView
//    }
//
//    @objc private func clickNext() {
//        if let nickname = nicknameView.nicknameField.text, !nickname.isEmpty {
//            selectTeamView = SelectTeamView(frame: self.view.frame)
//            self.view = selectTeamView
//        } else {
//            print("닉네임을 입력해주세요")
//        }
//    }
//}
