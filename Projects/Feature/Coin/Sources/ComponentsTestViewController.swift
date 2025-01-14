import UIKit
import Common
import SnapKit

public class ComponentsTestViewController: UIViewController {

  // MARK: - Property
  let button = PressingButton(title: "button", hasBackground: true, fontSize: .med)

  let numberView = NumberView()


  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    setComponenets()
    setLayout()

  }

}

extension ComponentsTestViewController {
  private func setComponenets() {
    view.addSubview(button)
    view.addSubview(numberView)

  }

  private func setLayout() {
    button.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.height.equalTo(100)
    }

    numberView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(button.snp.bottom)
      make.bottom.equalToSuperview()
    }

  }

}

