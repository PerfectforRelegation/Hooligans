
import UIKit

class NavigationBarController {
    static func setupCustomAppearance() {
        let appearance = UINavigationBar.appearance()

        appearance.barStyle = .default
        appearance.barTintColor = .systemIndigo
        //appearance.backgroundColor = .systemIndigo
        appearance.isTranslucent = false
    }
}
