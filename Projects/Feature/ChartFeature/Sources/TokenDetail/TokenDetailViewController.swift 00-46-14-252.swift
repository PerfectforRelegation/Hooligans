import UIKit
import Common
import RxSwift
import RxCocoa
import Domain


public final class TokenDetailViewController: UIViewController {
  // MARK: - Properties
  private var tokenDetailViewModel: TokenDetailViewModel
  private var disposBag = DisposeBag()

  private var pages: [UIViewController] = []

  private var viewDidAppearTrigger = PublishSubject<Void>()

  private let headerView = TokenDetailHeaderView()
  private let tabBar = TabBarView(tabs: ["차트", "호가"])


  // MARK: - Lifecycle
  public init(tokenDetailViewModel: TokenDetailViewModel) {
    self.tokenDetailViewModel = tokenDetailViewModel
    super.init(nibName: nil, bundle: nil)

    setup()
    bind()
  }

  required public init?(coder: NSCoder) {
    fatalError()
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = CommonAsset.background.color


    viewDidAppearTrigger.onNext(())
  }



}

extension TokenDetailViewController {
  // MARK: - Binding
  private func bind() {
    bindView()
    bindViewModel()
  }

  func bindView() {

  }

  func bindViewModel() {
    let input = TokenDetailViewModel.Input(viewDidAppear: viewDidAppearTrigger,
                                           selectTab: tabBar.selectTab.asObservable(),
                                           scrollTo: Observable.empty())

    let output = tokenDetailViewModel.transform(from: input)

    output.selectedTab
      .observe(on: MainScheduler.instance)
      .bind { [weak self] indexPath in
        guard let self = self,
              let frontView = self.pages[indexPath.row].view else { return }
        self.tabBar.selectTab(at: indexPath)
        self.view.bringSubviewToFront(frontView)
        self.view.bringSubviewToFront(self.tabBar)
      }
      .disposed(by: disposBag)

    output.tabBarPosition
      .observe(on: MainScheduler.instance)
      .bind { offset in
        self.tabBar.snp.updateConstraints { make in
          make.top.equalTo(self.view.safeAreaLayoutGuide).offset(offset)
        }
      }

  }
}

extension TokenDetailViewController {
  // MARK: - Setup
  private func setup() {
    setupViewControllers()
    setupSubviews()
    setupLayout()
  }

  private func setupSubviews() {
    view.addSubview(tabBar)
  }

  private func setupLayout() {
    tabBar.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).offset(headerHeight)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(60)
    }
  }

  private func setupViewControllers() {
    let firstPage = ChartViewController(tokenDetailViewModel: tokenDetailViewModel)
    let secondPage = OrderBookViewController()
    pages.append(firstPage)
    pages.append(secondPage)

    pages.forEach { viewController in
      addChild(viewController)
      view.addSubview(viewController.view)
      viewController.didMove(toParent: self)
      viewController.view.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }

    guard let frontViewController = pages[0].view else { return }
    view.bringSubviewToFront(frontViewController)
  }

}
