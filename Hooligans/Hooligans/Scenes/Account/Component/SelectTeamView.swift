import UIKit
import SnapKit

class SelectTeamView: UIView {

    var previousEmail: String?
    var previousPassword: String?
    var previousPhoneNumber: String?
    var previousNickname: String?
    var selectedTeam: (name: String, imageName: String)?

    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("뒤로", for: .normal)
        return button
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "팀을 골라주세요"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    let teamsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    let teams: [(name: String, imageName: String)] = [
        (name: "노팅엄", imageName: "NFO"),
        (name: "뉴캐슬", imageName: "NEW"),
        (name: "루턴 타운", imageName: "LUT"),
        (name: "리버풀", imageName: "LIV"),
        (name: "맨시티", imageName: "MCI"),
        (name: "맨유", imageName: "MUN"),
        (name: "번리", imageName: "BUR"),
        (name: "본머스", imageName: "BOU"),
        (name: "브라이튼", imageName: "BHA"),
        (name: "브렌트포드", imageName: "BRE"),
        (name: "셰필드", imageName: "SHU"),
        (name: "아스날", imageName: "ARS"),
        //(name: "아스톤 빌라", imageName: "AVL"),
        (name: "울버햄튼", imageName: "WOL"),
        (name: "에버턴", imageName: "EVE"),
        (name: "웨스트햄", imageName: "WHU"),
        (name: "첼시", imageName: "CHE"),
        (name: "크리스탈 팰리스", imageName: "CRY"),
        (name: "토트넘", imageName: "TOT"),
        (name: "풀럼", imageName: "FUL")
    ]

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
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(self).offset(20)
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self)
        }

        teamsTableView.translatesAutoresizingMaskIntoConstraints = false
        teamsTableView.backgroundColor = .clear

        teamsTableView.delegate = self
        teamsTableView.dataSource = self
        teamsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TeamCell")

        self.addSubview(teamsTableView)
        teamsTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-115)
        }

        self.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.leading.equalTo(self).offset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-40)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    @objc private func backButtonTapped() {
        guard let nicknameView = NicknameView(frame: self.frame) as? NicknameView else { return }
        nicknameView.previousEmail = previousEmail
        nicknameView.previousPassword = previousPassword
        nicknameView.previousPhoneNumber = previousPhoneNumber
        nicknameView.nicknameField.text = previousNickname

        self.superview?.addSubview(nicknameView)
        self.removeFromSuperview()
    }

    @objc private func nextButtonTapped() {
        guard let selectedIndexPath = teamsTableView.indexPathForSelectedRow else {
            print("팀을 선택해주세요.")
            return
        }
        selectedTeam = teams[selectedIndexPath.row]

        let signinController = SigninController()
        signinController.previousEmail = previousEmail
        signinController.previousPassword = previousPassword
        signinController.previousPhoneNumber = previousPhoneNumber
        signinController.previousNickname = previousNickname
        signinController.selectedTeam = selectedTeam

        self.removeFromSuperview()
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = signinController
            window.makeKeyAndVisible()
        }
    }
}

extension SelectTeamView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)

        let team = teams[indexPath.row]
        cell.textLabel?.text = team.name

        cell.imageView?.image = UIImage(named: team.imageName)
        //cell.imageView?.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        cell.imageView?.contentMode = .scaleAspectFit

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTeam = teams[indexPath.row]

        print("선택한 팀: \(selectedTeam)")
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}
