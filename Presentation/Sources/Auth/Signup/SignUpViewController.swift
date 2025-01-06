
import UIKit
import SnapKit
import RxSwift
import RxCocoa

public class SignUpViewController: UIViewController {
  private var viewModel: SignUpViewModel
  private var disposeBag = DisposeBag()

  let viewDidAppearTrigger = PublishSubject<Void>()

  let button1: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.frame = CGRect(origin: .zero, size: .zero)
    button.setTitle("To Tabbar", for: .normal)
    return button
  }()

  let button2: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.frame = CGRect(origin: .zero, size: .zero)
    button.setTitle("To Sign In", for: .normal)
    return button
  }()


  public init(viewModel: SignUpViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemYellow

    setView()
    setLayout()
    bind()


    viewDidAppearTrigger.onNext(())
  }

  func bind() {
    let input = SignUpViewModel.Input(tapButton: button1.rx.tap.asObservable())

    let output = viewModel.transform(from: input)

    //    output.movieList
    //      .observe(on: MainScheduler.instance)
    //      .bind(to: tableView.rx.items(cellIdentifier: TableViewCell.identifier, cellType: TableViewCell.self)) { (row, movie, cell) in
    //        cell.setup(movie: movie)
    //      }
    //      .disposed(by: disposeBag)
  }

}

extension SignUpViewController {
  func setView() {
    view.addSubview(button1)
    view.addSubview(button2)
  }

  func setLayout() {

    button1.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.equalTo(100)
      make.height.equalTo(50)
    }

    button2.snp.makeConstraints { make in
      make.top.equalTo(button1.snp.bottom).offset(10)
      make.centerX.equalToSuperview()
      make.width.equalTo(100)
      make.height.equalTo(50)
    }

  }
}
