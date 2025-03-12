import UIKit
import RxSwift
import Common


final class TokenDetailHeaderView: UIView {

  private let tokenNameLabel: UILabel = {
    let label = UILabel()
    label.text = "테슬라"
    label.font = .boldSystemFont(ofSize: 18)
    label.textColor = .white
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "\(21335)원"
    label.font = .boldSystemFont(ofSize: 22)
    label.textColor = .white
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = CommonAsset.background.color

    setComponents()
    setLayout()

  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError()
  }

}

extension TokenDetailHeaderView {
  private func setComponents() {
    addSubview(tokenNameLabel)
    addSubview(priceLabel)
  }

  private func setLayout() {
    tokenNameLabel.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview().inset(10)
      make.height.equalTo(18)
    }

    priceLabel.snp.makeConstraints { make in
      make.top.equalTo(tokenNameLabel.snp.bottom).offset(10)
      make.leading.trailing.equalToSuperview().inset(10)
      make.height.equalTo(25)
    }
  }
}
