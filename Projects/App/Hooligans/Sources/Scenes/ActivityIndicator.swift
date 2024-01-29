import UIKit

class ActivityIndicator: UIActivityIndicatorView {
    override init(style: Style) {
        super.init(style: style)
        self.color = .systemIndigo
        self.hidesWhenStopped = true
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.color = .systemIndigo
        self.hidesWhenStopped = true
    }

    func start(on view: UIView) {
        view.addSubview(self)
        self.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        self.startAnimating()
    }

    func stop() {
        self.stopAnimating()
        self.removeFromSuperview()
    }
}
