//
//import UIKit
//
//class EmojiUITextfField: UITextField {
//
//    enum TextFieldType {
//        case title
//        case team
//    }
//
//    private let authFieldType: TextFieldType
//    init(fieldType: TextFieldType) {
//        self.authFieldType = fieldType
//        super.init(frame: .zero)
//
//    }
//
//    override var textInputContextIdentifier: String? { "" }
//
//            override var textInputMode: UITextInputMode? {
//                for mode in UITextInputMode.activeInputModes {
//                    if mode.primaryLanguage == "emoji" {
//                        return mode
//                    }
//                }
//                return nil
//            }
//
//        
//
//
//                func commonInit() {
//                    NotificationCenter.default.addObserver(self, selector: #selector(inputModeDidChange), name: UITextField.textDidChangeNotification, object: nil)
//                }
//
//
//                @objc func inputModeDidChange(_ notification: Notification) {
//                    guard isFirstResponder else {
//                        return
//                    }
//
//                    DispatchQueue.main.async { [weak self] in
//                        self?.reloadInputViews()
//                    }
//                }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
