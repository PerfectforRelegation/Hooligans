import UIKit


final public class AnimatingText: UIView {

  let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 1
    label.textColor = .white
    label.font = .systemFont(ofSize: 18, weight: .bold)
    label.alpha = 0
    return label
  }()

  public init(text: String) {
    super.init(frame: .zero)
    self.label.text = text

    setComponent()
    setLayout()

    startAnimation()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

  public override func draw(_ rect: CGRect) {
        // Drawing code
    }


  func startAnimation() {
    UIView.animate(withDuration: 1.0) {
      let move = CGAffineTransform(translationX: 0, y: -100)

      self.label.transform = move
      self.label.alpha = 1
    }
  }

}

extension AnimatingText {
  private func setComponent() {
    addSubview(label)
  }

  private func setLayout() {
    label.frame = .init(x: 0, y: 100, width: bounds.width, height: bounds.height)
  }
}
