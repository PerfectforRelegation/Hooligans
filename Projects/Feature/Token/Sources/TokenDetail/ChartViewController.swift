import UIKit
import Domain
import RxSwift

final class ChartView: UIView {
  private lazy var disposeBag = DisposeBag()

  private let candleChartView = CandleChartView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setComponents()
    setLayout()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError()
  }

  func bind() -> Binder<[Candle]?> {
    return candleChartView.rx.candleData
  }
}

extension ChartView {
  private func setComponents() {
    addSubview(candleChartView)
  }

  private func setLayout() {
    self.snp.makeConstraints { make in
      make.height.equalTo(2000)
    }
    
    candleChartView.snp.makeConstraints { make in
      make.top.horizontalEdges.equalToSuperview()
      make.height.equalTo(500)
    }
  }
}
