import UIKit
import RxSwift
import Common


final class OrderBookViewController: UIViewController {
  private let disposeBag = DisposeBag()

  // MARK: - View Componenets
  private lazy var orderBookTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(OrderBookTableViewCell.self, forCellReuseIdentifier: OrderBookTableViewCell.identifier)
    tableView.backgroundColor = CommonAsset.background.color
    return tableView
  }()

  private let tabBar = TabBarView(tabs: ["차트", "호가"])

  // MARK: - Life Cycle
  public init(/*tokenDetailViewModel: TokenDetailViewModel*/) {
//    self.tokenDetailViewModel = tokenDetailViewModel
    super.init(nibName: nil, bundle: nil)
  }

  required public init?(coder: NSCoder) {
    fatalError()
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = CommonAsset.main.color

    setupSubviews()
    setupLayout()

//    bindViewModel()
//    bindView()

//    viewDidAppearTrigger.onNext(())
  }

}


extension OrderBookViewController {
  private func setupSubviews() {
    view.addSubview(orderBookTableView)
  }

  private func setupLayout() {
    orderBookTableView.snp.makeConstraints { make in
      make.top.leading.bottom.equalTo(view.safeAreaLayoutGuide)
      make.trailing.equalTo(view.snp.centerX)
    }
  }
}

