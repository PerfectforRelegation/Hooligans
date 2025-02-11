import UIKit


final class TokenExampleTableViewCell: UITableViewCell {
  static let identifier = "coinExampleTableViewCell"

  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 18)
    label.textColor = .black
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setComponent()
    setLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func configure(title: String) {
    self.titleLabel.text = title
  }

}

extension TokenExampleTableViewCell {
  private func setComponent() {
    addSubview(titleLabel)
  }

  private func setLayout() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
    ])
  }
}
