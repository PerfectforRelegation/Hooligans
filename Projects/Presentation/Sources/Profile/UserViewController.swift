import UIKit
import Domain
import SnapKit


class UserViewController: UIViewController {
    
    var users: [User]?
    
    private let userInfoView: UserInfoView = {
        let view = UserInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(origin: .zero, size: .zero)
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        interactor?.fetchUsers(request: UserModels.Users.Request(count: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        setupView()
        
    }
    
    func setup() {
        
    }
    
}

extension UserViewController {
    private func setupView() {                // 공부하기
        self.view.addSubview(userInfoView)
        
        userInfoView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    @objc func tapButton() {
        
    }
}
