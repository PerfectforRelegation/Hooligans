import UIKit
import SnapKit
import RxSwift
import RxCocoa

public class SignInViewController: UIViewController {
  private var viewModel: SignInViewModel
  private var disposeBag = DisposeBag()
  private var viewDidAppearTrigger = PublishSubject<Void>()

  private lazy var input = SignInViewModel.Input(
    viewDidAppear: viewDidAppearTrigger.asObservable(),
    tapButton: button1.rx.tap.asObservable()
  )

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


  public init(viewModel: SignInViewModel) {
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

    let output = viewModel.transform(from: input)

  }

}

extension SignInViewController {
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
