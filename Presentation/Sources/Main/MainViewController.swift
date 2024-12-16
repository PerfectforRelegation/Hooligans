
import UIKit
import SnapKit
import RxSwift
import RxCocoa

public class MainViewController: UIViewController {
  private var viewModel: MainViewModel
  private var disposeBag = DisposeBag()

  let viewDidAppearTrigger = PublishSubject<Void>()

  let button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.frame = CGRect(origin: .zero, size: .zero)
    button.setTitle("Auth", for: .normal)
    return button
  }()

  public init(viewModel: MainViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBlue

    setView()
    setLayout()
    bind()


    viewDidAppearTrigger.onNext(())
  }

  func bind() {
    let input = MainViewModel.Input(tapButton: button.rx.tap.asObservable())

    let output = viewModel.transform(from: input)

//    output.movieList
//      .observe(on: MainScheduler.instance)
//      .bind(to: tableView.rx.items(cellIdentifier: TableViewCell.identifier, cellType: TableViewCell.self)) { (row, movie, cell) in
//        cell.setup(movie: movie)
//      }
//      .disposed(by: disposeBag)
  }

}

extension MainViewController {
  func setView() {
    view.addSubview(button)
  }

  func setLayout() {
    button.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.height.equalTo(100)
    }
  }
}
