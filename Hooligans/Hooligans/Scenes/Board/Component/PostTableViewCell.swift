import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "PostCellIdentifier"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    let likesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "likeIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let commentsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "commentIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let likesLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let commentsLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    //    let videoPlayerView: AVPlayerView = {
    //            let playerView = AVPlayerView()
    //            return playerView
    //        }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }

        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(16)

            contentView.addSubview(likesLabel)
            likesLabel.snp.makeConstraints { make in
                make.top.equalTo(contentLabel.snp.bottom).offset(4)
                make.leading.equalTo(contentLabel)
            }

            contentView.addSubview(commentsLabel)
            commentsLabel.snp.makeConstraints { make in
                make.top.equalTo(likesLabel)
                make.leading.equalTo(likesLabel.snp.trailing).offset(8)

            }
        }
    }
}
