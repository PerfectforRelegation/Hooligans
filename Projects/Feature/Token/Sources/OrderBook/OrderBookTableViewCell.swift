import UIKit


final class OrderBookTableViewCell: UITableViewCell {
  static let identifier = "orderBookTableViewCell"

  // MARK: - View Components
  private let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "\(123123)"
    return label
  }()

  private let fluctuationRateLabel: UILabel = {
    let label = UILabel()
    label.text = "+\(0.7)%"
    return label
  }()

//  private let segmentTab: UISegmentedControl = {
//    let segment = UISegmentedControl()
//    segment.insertSegment(withTitle: "구매", at: 0, animated: true)
//    segment.insertSegment(withTitle: "판매", at: 1, animated: true)
//    segment.insertSegment(withTitle: "대기", at: 2, animated: true)
//    segment.selectedSegmentIndex = 0
//    return segment
//  }

  private let orderCountIndicatorView = OrderCountWithIndicatorView()


  // MARK: - Life Cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setComponents()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func configure() {

  }

}

extension OrderBookTableViewCell {
  private func setComponents() {
    addSubview(priceLabel)
    addSubview(fluctuationRateLabel)
    addSubview(orderCountIndicatorView)
  }

  private func setLayout() {
    priceLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(10)
      make.trailing.equalTo(self.snp.centerX)
    }

    fluctuationRateLabel.snp.makeConstraints { make in
      make.top.equalTo(priceLabel.snp.bottom).offset(6)
      make.bottom.equalToSuperview().inset(10)
      make.leading.equalTo(priceLabel.snp.leading)
      make.trailing.equalTo(self.snp.centerX)
    }

    orderCountIndicatorView.snp.makeConstraints { make in
      make.top.trailing.bottom.equalToSuperview()
      make.leading.equalTo(self.snp.centerX)
    }
  }
}


