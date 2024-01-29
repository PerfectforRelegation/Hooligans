
import UIKit
import SnapKit

class SigninHeader: UICollectionViewCell {
    static let identifier = "signinHeader"

    // MARK: - UI Components
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        let gif = UIImage.gifImageWithName("siu")
        imageView.contentMode = .scaleAspectFill
        imageView.image = gif
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.layer.opacity = 0
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String) {
        titleLabel.text = "Hoolignas"
        subTitleLabel.text = "계정 만들기"
    }
    
}

extension SigninHeader {
    // MARK: - UI Setup
    private func setupView() {
        self.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.width.height.equalTo(150)
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom)
        }
        
        self.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
        }

    }
}
