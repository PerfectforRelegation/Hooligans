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

  // MARK: - Life Cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = CommonAsset.background.color

    setComponents()
    setLayout()

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}


extension OrderBookView {
  private func setComponents() {
    addSubview(orderBookTableView)
  }

  private func setLayout() {
    self.snp.makeConstraints { make in
      make.height.equalTo(1700)
    }
    
    orderBookTableView.snp.makeConstraints { make in
      make.top.leading.bottom.equalTo(safeAreaLayoutGuide)
      make.trailing.equalTo(self.snp.centerX)
    }
  }
}

