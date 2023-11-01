import UIKit

class SelectTeamView: UIView {

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
            (name: "아스날", imageName: "ARS"),
            //(name: "아스톤 빌라", imageName: "AVL"),
            (name: "브라이튼", imageName: "BHA"),
            (name: "본머스", imageName: "BOU"),
            (name: "브렌트포드", imageName: "BRE"),
            (name: "번리", imageName: "BUR"),
            (name: "첼시", imageName: "CHE"),
            (name: "크리스탈 팰리스", imageName: "CRY"),
            (name: "에버턴", imageName: "EVE"),
            (name: "풀럼", imageName: "FUL"),
            (name: "리버풀", imageName: "LIV"),
            (name: "루턴 타운", imageName: "LUT"),
            (name: "맨시티", imageName: "MCI"),
            (name: "맨유", imageName: "MUN"),
            (name: "뉴캐슬", imageName: "NEW"),
            (name: "노팅엄", imageName: "NFO"),
            (name: "셰필드", imageName: "SHU"),
            (name: "토트넘", imageName: "TOT"),
            (name: "웨스트햄", imageName: "WHU"),
            (name: "울버햄튼", imageName: "WOL")
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
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        teamsTableView.translatesAutoresizingMaskIntoConstraints = false
        teamsTableView.backgroundColor = .clear // 테이블 뷰 배경 투명하게

        teamsTableView.delegate = self
        teamsTableView.dataSource = self
        teamsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TeamCell")
        self.addSubview(teamsTableView)
        NSLayoutConstraint.activate([
            teamsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            teamsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            teamsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            teamsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150)
        ])

        self.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    @objc private func backButtonTapped() {
        guard let nicknameView = NicknameView(frame: self.frame) as? NicknameView else { return }
        nicknameView.nicknameField.text = previousNickname

        self.superview?.addSubview(nicknameView)
        self.removeFromSuperview()
    }

    @objc private func nextButtonTapped() {
//        guard let selectedIndexPath = teamsTableView.indexPathForSelectedRow else {
//            print("팀을 선택해주세요.")
//            return
//        }
//        selectedTeam = teams[selectedIndexPath.row]
//
//        guard let phoneNumberView = PhonenumberView(frame: self.frame) as? PhonenumberView else { return }
//        phoneNumberView.previousNickname = previousNickname
//        phoneNumberView.selectedTeam = selectedTeam
//
//        self.superview?.addSubview(phoneNumberView)
//        self.removeFromSuperview()
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
