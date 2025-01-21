import UIKit
import CoinTesting
import Domain
import SnapKit

public class CoinExampleViewController: UIViewController {
  
  let button: UIButton = {
    let button = UIButton()
    button.setTitle("To coin list", for: .normal)

    return button
  }()

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red

    setComponents()
    setLayout()
  }


}

extension CoinExampleViewController {
  private func setComponents() {
    view.addSubview(button)

    button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
  }

  private func setLayout() {
    button.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.height.equalTo(50)
    }
  }

  @objc func tapButton() {
    let tokenRepository = MockTokenRepository()
    let tokenUseCase = TokenUseCase(repository: tokenRepository)
    let tokenListViewModel = TokenListViewModel(useCase: tokenUseCase)
    let tokenListViewController = TokenListViewController(viewModel: tokenListViewModel)

    self.navigationController?.pushViewController(tokenListViewController, animated: true)
  }
}
