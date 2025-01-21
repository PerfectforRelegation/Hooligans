import UIKit
import RxSwift
import RxCocoa

public final class TokenDetailViewController: UIViewController {
  // MARK: - Properties
  private var tokenDetailViewModel: TokenDetailViewModel
  private var disposBag = DisposeBag()

  private var viewDidAppearTrigger = PublishSubject<Void>()

  private let candleChartView = CandleChartView()


  // MARK: - Lifecycle
  public init(tokenDetailViewModel: TokenDetailViewModel) {
    self.tokenDetailViewModel = tokenDetailViewModel
    super.init(nibName: nil, bundle: nil)
  }

  required public init?(coder: NSCoder) {
    fatalError()
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()

    setComponents()
    setLayout()
    bind()

    viewDidAppearTrigger.onNext(())
  }

  func bind() {
    let input = TokenDetailViewModel.Input()

    let output = tokenDetailViewModel.transform(from: input)
    
    output.candleData
      .observe(on: MainScheduler.instance)
      .bind(to: candleChartView.rx.candles)

  }


}

extension TokenDetailViewController {
  private func setComponents() {
    view.addSubview(candleChartView)
  }

  private func setLayout() {
    candleChartView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide).inset(100)
    }
  }
}
