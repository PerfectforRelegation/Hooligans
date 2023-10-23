//
//  ChatPageViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 10/19/23.
//

import UIKit

enum Section: CaseIterable {
    case tabItem
    case pageView
}

enum ItemType {
    case tabItem
    case pageView
}

struct Item: Hashable {
    
    let data: Any
    let type: ItemType
    let identifier = UUID()
    
    init(data: Any, type: ItemType) {
        self.data = data
        self.type = type
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.identifier == rhs.identifier
    }

}

protocol ChatListDisplayLogic: AnyObject {
    func displayFixtureList(viewModel: ChatListModels.FixtureList.ViewModel)
}

class ChatListViewController: UIViewController {
    
    var interactor: (ChatListBusinessLogic & ChatListDataStore)?
    var router: ChatListRoutingLogic?
    
    // MARK: - View Initialize
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    private lazy var dataSource: DataSource = configureDataSource()
    private lazy var snapshot: Snapshot = Snapshot()
    
    private var collectionView: UICollectionView = {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return CollectionViewLayouts.Chat.allCases[section].section()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.showsVerticalScrollIndicator = false
//        collectionView.isScrollEnabled = false

        return collectionView
    }()
    
    private var containerView: UIPageViewController = UIPageViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        registerCells()
        setupView()
        bindView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchFixtureList(request: ChatListModels.FixtureList.Request())
    }
    
    private func setup() {
        let viewController = self
        let interactor = ChatListInteractor()
        let presenter = ChatListPresenter()
        let router = ChatListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func registerCells() {
        collectionView.register(ChatCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionViewHeader.identifier)
        collectionView.register(TabItemCell.self, forCellWithReuseIdentifier: TabItemCell.identifier)
        collectionView.register(FixtureCell.self, forCellWithReuseIdentifier: FixtureCell.identifier)
    }
    
    
}

extension ChatListViewController {
    private func setupView() {
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    
    private func configureDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: self.collectionView) { collectionView, indexPath, item in
            switch item.type {
            case .tabItem:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabItemCell.identifier,
                                                                    for: indexPath) as? TabItemCell else { return UICollectionViewCell() }
                if let data = item.data as? TabItem { cell.configureCell(item: data) }
                
                return cell
                
            case .pageView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FixtureCell.identifier,
                                                              for: indexPath) as? FixtureCell
                if let data = item.data as? Fixture { cell?.configureCell(fixture: data) }
                
                return cell
            }
        }
        
        configureHeader(of: dataSource)
        return dataSource
    }
    
    func configureHeader(of dataSource: DataSource) {
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                       withReuseIdentifier: ChatCollectionViewHeader.identifier,
                                                                       for: indexPath) as? ChatCollectionViewHeader
            
//            view?.title = "Chat"
            //            view?.seeAllButton.addTarget(self, action: #selector(self.showWhatsNewViewController), for: .touchUpInside)
            //            view?.removeStackSubviews()
            
            //            switch section {
            //            case .tabItem:
            //                guard let username = self.viewModel.username else { return view }
            //                let colorString = NSMutableAttributedString(string: username)
            //                let range = NSRange.init(location: 0, length: username.count)
            //                colorString.addAttribute(.foregroundColor, value: UIColor.systemTeal, range: range)
            //                colorString.append(NSAttributedString(string: section.title))
            //                view?.label.attributedText = colorString
            //            case .pageView:
            //
            //            default:
            //                break
            //            }
            return view
        }
    }
    
    private func bindView() {
        snapshot.appendSections([.tabItem, .pageView])
        snapshot.appendItems([Item(data: TabItem(title: "Fixtures", isTabbed: true), type: .tabItem), Item(data: TabItem(title: "Team", isTabbed: false), type: .tabItem)], toSection: .tabItem)
        self.dataSource.apply(self.snapshot)
    }
    
}

extension ChatListViewController: ChatListDisplayLogic {
    func displayFixtureList(viewModel: ChatListModels.FixtureList.ViewModel) {
        DispatchQueue.main.async {
            viewModel.fixtures.forEach { fixture in
                let fixtureItem = Item(data: fixture, type: .pageView)
                self.snapshot.appendItems([fixtureItem], toSection: .pageView)
                self.dataSource.apply(self.snapshot)
            }
        }
        
    }
}

extension ChatListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            var currentSnapshot = dataSource.snapshot()

            // 2. Retrieve the item associated with the selected cell from the data source
            let selectedItem = dataSource.itemIdentifier(for: indexPath)
            
            if var item = selectedItem {
                // 3. Modify the item's data (e.g., change a property)
                let newItem = Item(data: TabItem(title: "title", isTabbed: false), type: .tabItem)
                
                
                // 5. Apply the updated snapshot to the data source
                dataSource.apply(currentSnapshot, animatingDifferences: true)
            }
        }
        
    }
}

extension ChatListViewController: UICollectionViewFlowLayout {
    
}
