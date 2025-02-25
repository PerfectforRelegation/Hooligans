import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class TabMenuView: UIView {
  private let disposeBag = DisposeBag()
  
  private var tabs: [String]?

  private lazy var tabMenuCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .blue
    collectionView.register(TabMenuCell.self, forCellWithReuseIdentifier: TabMenuCell.identifier)
    collectionView.dataSource = self

    return collectionView
  }()

  private let indicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()

  convenience init(tabs: [String]) {
    self.init(frame: .zero)
    self.tabs = tabs

    setComponents()
    setLayout()

    bind()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  func tabMenu() -> Observable<IndexPath> {
    return tabMenuCollectionView.rx.itemSelected.asObservable()
  }

  private func bind() {
    tabMenuCollectionView.rx.itemSelected
      .observe(on: MainScheduler.instance)
      .subscribe { [weak self] indexPath in
        self?.moveIndicator(to: indexPath)
      }
      .disposed(by: disposeBag)
  }

  private func moveIndicator(to indexPath: IndexPath) {
    guard let cell = tabMenuCollectionView.cellForItem(at: indexPath) else { return }
    UIView.animate(withDuration: 0.3) {
      self.indicatorView.snp.updateConstraints { make in
        make.leading.equalTo(cell.frame.origin.x)
        make.width.equalTo(cell.frame.width)
      }
      self.layoutIfNeeded()
    }
  }

}

extension TabMenuView {
  private func setComponents() {
    addSubview(tabMenuCollectionView)
    addSubview(indicatorView)
  }

  private func setLayout() {
    indicatorView.snp.makeConstraints { make in
      make.leading.bottom.equalToSuperview()
      make.width.equalTo(0)
      make.height.equalTo(6)
    }

    tabMenuCollectionView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
      make.bottom.equalTo(indicatorView.snp.top)
    }

  }
}

extension TabMenuView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let tabs = tabs else { return 0 }
    return tabs.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabMenuCell.identifier, for: indexPath) as? TabMenuCell,
          let tabs = tabs else { return UICollectionViewCell() }
    cell.configure(title: tabs[indexPath.row])
    return cell
  }


}
