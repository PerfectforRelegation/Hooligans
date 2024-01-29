
import UIKit

class Button: UIButton {

    enum FontSize {
        case big
        case med
        case small
    }

    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .black : .clear

        let titleColor: UIColor = hasBackground ? .white : .black
        self.setTitleColor(titleColor, for: .normal)

        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)

        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)

        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
