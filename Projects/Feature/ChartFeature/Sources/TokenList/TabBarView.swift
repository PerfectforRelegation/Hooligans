import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class TabBarView: UIView {
  private let disposeBag = DisposeBag()

  private var tabs: [String]
  var selectTab: ControlEvent<IndexPath> { tabBarCollectionView.rx.itemSelected }
//  var itemselected = PublishSubject<IndexPath>()

  private lazy var tabBarCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(TabBarCell.self, forCellWithReuseIdentifier: TabBarCell.identifier)

    return collectionView
  }()

  private let indicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()


  init(tabs: [String]) {
    self.tabs = tabs
    super.init(frame: .zero)

    setup()
    bind()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  func selectTab(at indexPath: IndexPath) {
    moveIndicator(to: indexPath)
  }

  private func moveIndicator(to indexPath: IndexPath) {
    guard let cell = tabBarCollectionView.cellForItem(at: indexPath) else { return }
    UIView.animate(withDuration: 0.3) {
      self.indicatorView.snp.updateConstraints { make in
        make.leading.equalTo(cell.frame.origin.x)
        make.width.equalTo(cell.frame.width)
      }
      self.layoutIfNeeded()
    }
  }

}

extension TabBarView {
  private func bind() {
    bindView()
  }

  private func bindView() {
    Observable.just(tabs)
      .observe(on: MainScheduler.instance)
      .bind(to: tabBarCollectionView.rx.items(cellIdentifier: TabBarCell.identifier, cellType: TabBarCell.self)) { index, title, cell in
        if index == 0 {
          self.selectTab(at: .init(row: index, section: 0))
        }
        cell.configure(title: title)
      }
      .disposed(by: disposeBag)

//    itemselected
//      .observe(on: MainScheduler.instance)
//      .subscribe { [weak self] indexPath in
//        self?.moveIndicator(to: indexPath)
//      }
//      .disposed(by: disposeBag)
  }
}

extension TabBarView {
  private func setup() {
    setupSubviews()
    setupLayout()
  }

  private func setupSubviews() {
    addSubview(tabBarCollectionView)
    addSubview(indicatorView)
  }

  private func setupLayout() {
    indicatorView.snp.makeConstraints { make in
      make.leading.bottom.equalToSuperview()
      make.width.equalTo(0)
      make.height.equalTo(5)
    }

    tabBarCollectionView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
      make.bottom.equalTo(indicatorView.snp.top)
    }

  }
}
