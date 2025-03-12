import UIKit
import RxSwift
import DesignSystem

open class BaseView: UIView {
  public var disposeBag = DisposeBag()

  public init() {
    super.init(frame: .zero)
    setupSubViews()
    setupLayout()
  }

  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open func setupSubViews() { }
  open func setupLayout() { }
  open func configure() { }
}
