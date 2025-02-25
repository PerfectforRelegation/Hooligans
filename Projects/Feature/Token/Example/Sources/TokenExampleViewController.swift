import UIKit
import Coin
import CoinTesting
import Domain


enum Flow: CaseIterable {
  case tokenList
  case tokenDetail

  var title: String {
    switch self {
    case .tokenList:
      return "토큰 리스트 뷰"
    case .tokenDetail:
      return "토큰 디테일 뷰"
    }
  }

  func go() -> UIViewController {
    switch self {
    case .tokenList:
      let repository = MockTokenRepository()
      let useCase = TokenUseCase(repository: repository)
      let viewModel = TokenListViewModel(useCase: useCase)
      let viewController = TokenListViewController(viewModel: viewModel)

      return viewController

    case .tokenDetail:
      let repository = MockTokenRepository()
      let useCase = TokenUseCase(repository: repository)
      let viewModel = TokenDetailViewModel(useCase: useCase)
      let viewController = TokenDetailViewController(tokenDetailViewModel: viewModel)

      return viewController
    }
  }
}

public final class TokenExampleViewController: UIViewController {
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(TokenExampleTableViewCell.self, forCellReuseIdentifier: TokenExampleTableViewCell.identifier)
    return tableView
  }()

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    setComponents()
    setLayout()
  }


}

extension TokenExampleViewController {
  private func setComponents() {
    tableView.delegate = self
    tableView.dataSource = self

    view.addSubview(tableView)
  }

  private func setLayout() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

extension TokenExampleViewController: UITableViewDelegate, UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Flow.allCases.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TokenExampleTableViewCell.identifier, for: indexPath) as? TokenExampleTableViewCell else { return UITableViewCell() }
    cell.configure(title: Flow.allCases[indexPath.row].title)
    return cell
  }

  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = Flow.allCases[indexPath.row].go()
    navigationController?.pushViewController(viewController, animated: true)
  }
}
