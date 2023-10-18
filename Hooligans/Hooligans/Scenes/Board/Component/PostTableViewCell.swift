import UIKit
import SnapKit

struct Posting {
    var title: String
    var content: String
}

class PostTableViewCell: UITableViewCell {
    static let identifier = "PostCell"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }

    func configure(with Posting: Posting) {
        titleLabel.text = Posting.title
        contentLabel.text = Posting.content
    }
}
