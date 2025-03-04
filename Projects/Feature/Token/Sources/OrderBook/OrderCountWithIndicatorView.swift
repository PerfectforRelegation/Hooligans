import UIKit
import SnapKit


final public class OrderCountWithIndicatorView: UIView {

  let countLabel: UILabel = {
    let label = UILabel()
    label.text = "100"
    return label
  }()

  let indicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemRed
    view.alpha = 0.3
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setComponents()
    setLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension OrderCountWithIndicatorView {
  private func setComponents() {
    addSubview(countLabel)
    addSubview(indicatorView)
  }

  private func setLayout() {
    countLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.trailing.equalToSuperview().inset(10)
    }

    indicatorView.snp.makeConstraints { make in
      make.top.leading.trailing.bottom.equalToSuperview()
//      make.leading.equalTo(self.snp.trailing)
    }
  }
}
