import UIKit
import Domain
import Common


final public class UIsExampleViewController: UIViewController {

  private let animatingLabel = AnimatingText(text: "Animating")

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red

    setComponent()
    setLayout()
  }


}

extension UIsExampleViewController {
  private func setComponent() {
    view.addSubview(animatingLabel)
  }

  private func setLayout() {
    animatingLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.height.equalTo(100)
    }

  }
}
