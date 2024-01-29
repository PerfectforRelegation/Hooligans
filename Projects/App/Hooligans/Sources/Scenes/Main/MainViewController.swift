//
//  MainViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import UIKit
import SnapKit
import StompClientLib

protocol MainDisplayLogic: AnyObject {
    func displaySomething(viewModel: MainModels.Main.ViewModel)
}

class MainViewController: UIViewController {
    var interactor: (MainBusinessLogic & MainDataStore)?
    var router: MainRoutingLogic?
    
    typealias DataSource = UICollectionViewDiffableDataSource<MainModels.Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MainModels.Section, Item>
    
    private lazy var dataSource: DataSource = configureDataSource()
    private lazy var snapshot: Snapshot = Snapshot()
    
    // MARK: - View Initailize
    private let headerView = MainHeaderView()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return Layouts.Main.allCases[section].section()
        }
        let collectionView = UICollectionView(frame: CGRect(origin: .zero, size: .zero), collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        bindView()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.addKeyboardNotifications()
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        registerCells()
        setupView()
        interactor?.fetchMainSource(request: MainModels.Main.Request())
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardNotifications()
    }

    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    private func registerCells() {
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.identifier)
        collectionView.register(ChatButtonCell.self, forCellWithReuseIdentifier: ChatButtonCell.identifier)
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
        collectionView.register(BetResultCell.self, forCellWithReuseIdentifier: BetResultCell.identifier)
        collectionView.register(FixtureCell.self, forCellWithReuseIdentifier: FixtureCell.identifier)
        collectionView.register(NewsPostCell.self, forCellWithReuseIdentifier: NewsPostCell.identifier)
    }
    
    private func bindView() {
        snapshot.appendSections([.chat, .profile, .result, .fixture, .news])
        snapshot.appendItems([Item(data: "")], toSection: .chat)
        self.dataSource.apply(self.snapshot)
    }

}

extension MainViewController {
    private func setupView() {
        self.view.backgroundColor = .main
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().priority(.high)
        }
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(125)
        }
    }
    
    @objc func routeToHistory() {
        router?.routeToHistory()
    }
  
    @objc func routeToChatRoom() {
//        router?.routeToChatList()
    }
    
    private func configureDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: self.collectionView) { collectionView, indexPath, item in
            guard let section = MainModels.Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
            switch section {
            case .chat:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatButtonCell.identifier, for: indexPath) as? ChatButtonCell else { return UICollectionViewCell() }
                cell.confitureCell()
//                cell.chatButton.addTarget(self, action: #selector(self.routeToChatRoom), for: .touchUpInside)
                return cell
                
            case .profile:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier,
                                                   for: indexPath) as? ProfileCell else { return UICollectionViewCell() }
                if let data = item.data as? MainUser { cell.configureCell(user: data) }
                cell.historyButton.addTarget(self, action: #selector(self.routeToHistory), for: .touchUpInside)
                return cell
                
            case .result:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BetResultCell.identifier, for: indexPath) as? BetResultCell else { return UICollectionViewCell() }
                if let data = item.data as? BetResult {
                    cell.configureCell(betResult: data)
                }
                return cell
                
            case .fixture:
                 guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FixtureCell.identifier,
                                                                     for: indexPath) as? FixtureCell else { return UICollectionViewCell() }
                if let data = item.data as? Fixture { cell.configureCell(fixture: data) }
                cell.clipsToBounds = true
                return cell
                
            case .news:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsPostCell.identifier, for: indexPath) as? NewsPostCell else { return UICollectionViewCell() }
                if let data = item.data as? Post { cell.configureCell(post: data) }
                return cell
            }
            
        }
        
        configureHeader(of: dataSource)
        return dataSource
    }
    
    private func configureHeader(of dataSource: DataSource) {
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                       withReuseIdentifier: CollectionViewHeader.identifier,
                                                                       for: indexPath) as? CollectionViewHeader
            switch section {
            case .chat:
                view?.configureCell(title: "")
            case .profile:
                view?.configureCell(title: "")
            case .result:
                view?.configureCell(title: "")
            case .fixture:
                view?.configureCell(title: "이주의 경기")
            case .news:
                view?.configureCell(title: "뉴스")
            }
            
            return view
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // 노티피케이션을 추가하는 메서드
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드가 나타날 때 코드
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let bottomInset = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets.bottom ?? 0
            let adjustedKeyboardHeight = keyboardHeight - bottomInset
            // bottomBaseView의 높이를 올려준다
            
            
            view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드가 사라졌을 때 코드
        
    }
    
}

extension MainViewController: MainDisplayLogic {
    func displaySomething(viewModel: MainModels.Main.ViewModel) {
        DispatchQueue.main.async {
            // MARK: - User Profile
            let userItem = Item(data: viewModel.mainSource.user)
            self.snapshot.deleteItems([userItem])
            self.snapshot.appendItems([userItem], toSection: .profile)
            
            // MARK: - Live Fixtures
            viewModel.mainSource.fixtures.forEach { fixture in
                let fixtureItem = Item(data: fixture)
                self.snapshot.deleteItems([fixtureItem])
                self.snapshot.appendItems([fixtureItem], toSection: .fixture)
            }
            
            // MARK: - Bet Result
//            if let betResult = viewModel.mainSource.bet.last {
//                let betResult = Item(data: betResult)
//                self.snapshot.appendItems([betResult], toSection: .result)
//            }
            
            // MARK: - News Posts
            viewModel.mainSource.news.posts.forEach { post in
                let newsPostItem = Item(data: post)
                self.snapshot.deleteItems([newsPostItem])
                self.snapshot.appendItems([newsPostItem], toSection: .news)
            }
            self.dataSource.apply(self.snapshot)
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
//            router?.routeToChatList()
        } else if indexPath.section == 4 {
            let data = dataSource.snapshot(for: .news).items[indexPath.item].data as? Post
            guard let query = data?.href else { return }
            let webViewController = WebViewController(base: "https://sports.news.naver.com/", query: query)
            webViewController.modalPresentationStyle = .overCurrentContext
            navigationController?.present(webViewController, animated: true)
            
        }
    }
    
}
