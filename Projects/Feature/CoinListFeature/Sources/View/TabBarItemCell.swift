import UIKit


final class TabBarItemCell: UICollectionViewCell {
  static let identifier = "tabBarItemCell"

  override var isSelected: Bool {
    willSet {
      UIView.animate(withDuration: 1.0) {
        self.titleLabel.textColor = newValue ? .white : .lightGray
      }
    }
  }

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 18)
    label.textColor = .white
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .black

    setComponents()
    setLayout()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError()
  }

  func configure(title text: String) {
    self.titleLabel.text = text
  }

  func adjustCellSize() -> CGSize {
//    let targetSize = CGSize(UIView.layoutFittingCompressedSize)
    return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
  }
}


extension TabBarItemCell {
  private func setComponents() {
    addSubview(titleLabel)
  }

  private func setLayout() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
    ])
  }
}
