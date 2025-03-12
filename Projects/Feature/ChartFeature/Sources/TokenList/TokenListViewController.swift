import UIKit
import Common
import SnapKit
import RxSwift
import RxCocoa


public class TokenListViewController: BaseViewController {
  private var viewModel: TokenListViewModel
  private var disposeBag = DisposeBag()

  // MARK: - Components
  private let header = TokenListViewHeader()
  private let tabMenu = TabBarView(tabs: ["국내", "해외"])
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TokenListTableViewCell.self, forCellReuseIdentifier: TokenListTableViewCell.identifier)
    return tableView
  }()


  private var headerHeight: CGFloat = 100

  public init(viewModel: TokenListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    setComponents()
    setLayout()
    bind()

    tableView.rx.contentOffset
      .observe(on: MainScheduler.instance)
      .subscribe { [weak self] offset in
        guard let self = self else { return }
        let newHeight = max(self.headerHeight - offset.y, 0)
        self.header.snp.updateConstraints { make in
          make.height.equalTo(newHeight)
        }
        self.header.alpha = newHeight / headerHeight
      }
      .disposed(by: disposeBag)

  }

  func bind() {
    let input = TokenListViewModel.Input(viewDidLoad: viewDidLoadPublisher,
                                         selectTap: tableView.rx.modelSelected(TokenListTableViewCell.self).asObservable())
    let output = viewModel.transform(from: input)

    output.clubList
      .observe(on: MainScheduler.instance)
      .bind(to: tableView.rx.items(cellIdentifier: TokenListTableViewCell.identifier, cellType: TokenListTableViewCell.self)) { index, token, cell in
        cell.configure(rank: index + 1, club: token)
      }
      .disposed(by: disposeBag)

  }

}

extension TokenListViewController {
  func setComponents() {
    view.backgroundColor = CommonAsset.background.color
    view.addSubview(header)
    view.addSubview(tabMenu)
    view.addSubview(tableView)
  }

  func setLayout() {
    header.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
      make.height.equalTo(headerHeight)
    }

    tabMenu.snp.makeConstraints { make in
      make.top.equalTo(header.snp.bottom)
      make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
      make.height.equalTo(60)
    }

    tableView.snp.makeConstraints { make in
      make.top.equalTo(tabMenu.snp.bottom)
      make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
}
