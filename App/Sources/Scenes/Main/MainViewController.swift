//
//  MainViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 2023/09/14.
//

import UIKit
import SnapKit

protocol MainDisplayLogic: AnyObject {
    func displaySomething(viewModel: MainModels.Main.ViewModel)
}

class MainViewController: UIViewController {
    var interactor: (MainBusinessLogic & MainDataStore)?
    var router: MainRoutingLogic?
    
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
        collectionView.dataSource = self
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
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
