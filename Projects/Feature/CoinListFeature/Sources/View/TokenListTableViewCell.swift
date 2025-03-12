import UIKit
import DesignSystem
import CoinDomainInterface

class TokenListTableViewCell: UITableViewCell {
  static let identifier = "tokenListTableViewCell"

  // MARK: - Property

  

  // MARK: - View component
  private let rankingLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .blue
    return label
  }()

  private let coinImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .systemYellow
    image.layer.cornerRadius = 30 / 2
    image.clipsToBounds = true
    return image
  }()

  private let coinNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    return label
  }()

  private let priceWithPercentageLabel: PriceWithPercentageLabel = {
    let label = PriceWithPercentageLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  // MARK: - Life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = DesignSystemAsset.background.color

    setComponents()
    setLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(rank row: Int, coin: Coin) {
    rankingLabel.text = String(row)
    coinImage.image = UIImage(systemName: "house.fill")
    coinNameLabel.text = coin.clubName
    priceWithPercentageLabel.setup(current: Int(coin.currentPrice)!)
  }

}

extension TokenListTableViewCell {
  private func setComponents() {
    addSubview(rankingLabel)
    addSubview(coinImage)
    addSubview(coinNameLabel)
    addSubview(priceWithPercentageLabel)
  }

  private func setLayout() {
    rankingLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().inset(10)
      make.width.height.equalTo(30)
    }

    coinImage.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.equalTo(rankingLabel.snp.trailing).offset(10)
      make.width.height.equalTo(30)
    }

    coinNameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.equalTo(coinImage.snp.trailing).offset(20)
//      make.trailing.equalToSuperview().inset(20)
      make.height.equalTo(30)
    }

    priceWithPercentageLabel.snp.makeConstraints { make in
      make.top.equalTo(coinNameLabel.snp.bottom).offset(6)
      make.leading.equalTo(coinNameLabel.snp.leading)
      make.bottom.equalToSuperview().inset(10)
    }
  }

  
}
