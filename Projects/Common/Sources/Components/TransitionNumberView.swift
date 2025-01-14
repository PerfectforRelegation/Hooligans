import UIKit
import SwiftUI
import SnapKit


public class TransitionNumberView: UIView {
  private let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  let numberTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.isScrollEnabled = false
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    return tableView
  }()

  public override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemRed

    configuration()
    setComponents()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configuration() {
    numberTableView.delegate = self
    numberTableView.dataSource = self

    numberTableView.register(NumberCell.self, forCellReuseIdentifier: NumberCell.identifier)
  }

  func changeNumber() {
    
  }

}

extension TransitionNumberView {
  func setComponents() {
    addSubview(numberTableView)
  }

  func setLayout() {
    numberTableView.snp.makeConstraints { make in
      make.top.leading.trailing.bottom.equalToSuperview()
    }
  }
}


extension TransitionNumberView: UITableViewDelegate, UITableViewDataSource {
  public func tableView(_ tableView: UITableView,
                        numberOfRowsInSection section: Int) -> Int {
    return numbers.count
  }

  public func tableView(_ tableView: UITableView,
                        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard 
      let cell = tableView.dequeueReusableCell(withIdentifier: NumberCell.identifier, for: indexPath) as? NumberCell else { return UITableViewCell() }
    cell.configuration(number: String(numbers[indexPath.row]))
    return cell
  }

  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return frame.height
  }
}

class NumberCell: UITableViewCell {
  static let identifier = "numberCell"

  private let numberLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.numberOfLines = 1
    label.textAlignment = .center
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configuration(number value: String) {
    self.numberLabel.text = value
  }

  func setLayout() {
    addSubview(numberLabel)

    numberLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.height.equalToSuperview()
    }
  }
}

struct TransitionNumberPreView: PreviewProvider {
    static var previews: some View {
        // Preview를 보고자 하는 ViewController를 넣으면 됩니다.
      TransitionNumberView().toPreview()
    }
}
