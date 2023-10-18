import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "PostCellIdentifier"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.9098, green: 0.3176, blue: 0.4431, alpha: 1.0)
        return label
    }()

    let commentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.1569, green: 0.4039, blue: 0.8275, alpha: 1.0) /* #2867d3 */
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

    func configure(with post: Post) {
        titleLabel.text = post.title
        contentLabel.text = post.content
        likesLabel.text = "\(post.likes)"
        commentsLabel.text = "\(post.comments)"


//        likesImageView.isHidden = post.likes == 0
//        commentsImageView.isHidden = post.comments == 0
    }

    private func setupUI() {
        contentView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }

        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        contentView.addSubview(likesImageView)
        likesImageView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(15)
        }

        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(likesImageView)
            make.leading.equalTo(likesImageView.snp.trailing).offset(4)
        }

        contentView.addSubview(commentsImageView)
        commentsImageView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(15)
            make.leading.equalTo(likesLabel.snp.trailing).offset(16)
            make.width.height.equalTo(15)
        }

        contentView.addSubview(commentsLabel)
        commentsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(commentsImageView)
            make.leading.equalTo(commentsImageView.snp.trailing).offset(4)
        }
    }
}
