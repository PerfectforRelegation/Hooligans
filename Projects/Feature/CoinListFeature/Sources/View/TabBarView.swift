import UIKit
import SnapKit
import RxSwift
import RxCocoa
import BaseFeature

final class TabBarView: BaseView {
  // MARK: - Properties
  var itemSelected: ControlEvent<IndexPath> { tabBarCollectionView.rx.itemSelected }

  private lazy var tabBarCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(TabBarItemCell.self, forCellWithReuseIdentifier: TabBarItemCell.identifier)

    return collectionView
  }()

  private let indicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()

  // MARK: - Init
  override func setupSubViews() {
    addSubview(tabBarCollectionView)
    addSubview(indicatorView)
  }

  override func setupLayout() {
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

  func items(_ items: [Tab]) {
    Observable.just(items)
      .observe(on: MainScheduler.instance)
      .bind(to: tabBarCollectionView.rx.items(cellIdentifier: TabBarItemCell.identifier, cellType: TabBarItemCell.self)) { index, item, cell in
        cell.configure(title: item.rawValue)
      }
      .disposed(by: disposeBag)
  }

  func selectTab(at index: IndexPath) {
    moveIndicator(to: index)
  }

  func bindState() {

  }

  func bindAction() {

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
