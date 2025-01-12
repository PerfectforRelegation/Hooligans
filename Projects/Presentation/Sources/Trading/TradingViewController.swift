
import UIKit
import SnapKit
import RxSwift
import RxCocoa

public class TradingViewController: UIViewController {
  private var viewModel: TradingViewModel
  private var disposeBag = DisposeBag()

  let viewDidAppearTrigger = PublishSubject<Void>()

  private let stockChartView: UIView = {
    let view = CandleChartView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.frame = .zero
    return view
  }()

  let button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.frame = CGRect(origin: .zero, size: .zero)
    button.setTitle("To Detail", for: .normal)
    return button
  }()

  public init(viewModel: TradingViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemRed

    setView()
    setLayout()
    bind()


    viewDidAppearTrigger.onNext(())
  }

  func bind() {
    let input = TradingViewModel.Input(tapButton: button.rx.tap.asObservable())

    let output = viewModel.transform(from: input)

//    output.movieList
//      .observe(on: MainScheduler.instance)
//      .bind(to: tableView.rx.items(cellIdentifier: TableViewCell.identifier, cellType: TableViewCell.self)) { (row, movie, cell) in
//        cell.setup(movie: movie)
//      }
//      .disposed(by: disposeBag)
  }

}

extension TradingViewController {
  func setView() {
    view.addSubview(stockChartView)
    view.addSubview(button)
  }

  func setLayout() {

    stockChartView.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
      make.height.equalTo(view.bounds.height / 3)
    }
    button.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(stockChartView.snp.bottom).offset(20)
      make.width.height.equalTo(100)
    }
  }
}
