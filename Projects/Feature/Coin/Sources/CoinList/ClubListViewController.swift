
import UIKit
import SnapKit
import RxSwift
import RxCocoa

public class ClubListViewController: UIViewController {
  private var viewModel: ClubListViewModel
  private var disposeBag = DisposeBag()

  let viewDidAppearTrigger = PublishSubject<Void>()

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(ClubListTableViewCell.self, forCellReuseIdentifier: ClubListTableViewCell.identifier)

    return tableView
  }()

  public init(viewModel: ClubListViewModel) {
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
    let input = ClubListViewModel.Input(viewDidAppear: viewDidAppearTrigger)

    let output = viewModel.transform(from: input)

    output.clubList
      .observe(on: MainScheduler.instance)
      .bind(to: tableView.rx.items(cellIdentifier: ClubListTableViewCell.identifier, cellType: ClubListTableViewCell.self)) { (row, club, cell) in
        cell.configure(club: club)
      }
      .disposed(by: disposeBag)
  }

}

extension ClubListViewController {
  func setView() {
    view.addSubview(tableView)
  }

  func setLayout() {
    tableView.snp.makeConstraints { make in
      make.top.leading.trailing.bottom.equalToSuperview()
    }
  }
}
