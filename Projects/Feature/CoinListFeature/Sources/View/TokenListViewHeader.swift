import UIKit


final class TokenListViewHeader: UIView {
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 24)
    label.textColor = .white
    label.text = "거래량 Top20"
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .black
    setComponent()
    setLayout()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError()
  }
}

extension TokenListViewHeader {
  private func setComponent() {
    addSubview(titleLabel)
  }

  private func setLayout() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
    ])
  }
}
