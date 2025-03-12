import UIKit
import SnapKit
import RxSwift
import RxCocoa
import BaseFeature
import DesignSystem


final class CoinListViewController: BaseViewController {
  // MARK: - Properties
  private var viewModel: CoinListViewModel
  private var disposeBag = DisposeBag()

  // MARK: - Subviews
  private let tabBarView: TabBarView = {
    let tabBarView = TabBarView()
    tabBarView.items(Tab.allCases)
    return tabBarView
  }()
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = DesignSystemAsset.background.color
    tableView.showsHorizontalScrollIndicator = false
    tableView.register(TokenListTableViewCell.self, forCellReuseIdentifier: TokenListTableViewCell.identifier)
    return tableView
  }()

  // MARK: - Init
  init(viewModel: CoinListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Life Cycle


  // MARK: - Binding
  override func bindState() {
    
  }

  override func bindAction() {
    let input = CoinListViewModel.Input(viewDidLoad: viewDidLoadPublisher,
                                        selectTab: tabBarView.itemSelected.asObservable())
    let output = viewModel.transform(from: input)

    output.coinList
      .observe(on: MainScheduler.instance)
      .bind(to: tableView.rx.items(cellIdentifier: TokenListTableViewCell.identifier, cellType: TokenListTableViewCell.self)) { index, coin, cell in
        cell.configure(rank: index + 1, coin: coin)
      }
      .disposed(by: disposeBag)

    output.selectedTab
      .observe(on: MainScheduler.instance)
      .bind { [weak self] index in
        guard let self = self else { return }
        self.tabBarView.selectTab(at: index)
      }
      .disposed(by: disposeBag)
  }

  // MARK: - View Setup
  override func setupSubviews() {
    view.addSubview(tableView)
    view.addSubview(tabBarView)
  }

  override func setupLayout() {
    tabBarView.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
      make.height.equalTo(60)
    }

    tableView.snp.makeConstraints { make in
      make.top.equalTo(tabBarView.snp.bottom)
      make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
}
