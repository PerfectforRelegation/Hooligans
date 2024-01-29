import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "PostCellIdentifier"

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let uploadTimeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.semibold(size: 18)
        label.numberOfLines = 0
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular(size: 14)
        label.numberOfLines = 0
        return label
    }()

    let likesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.5
        return imageView
    }()

    let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .red
        label.alpha = 0.5
        return label
    }()

    let commentsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "ellipsis.bubble")?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.5
        return imageView
    }()

    let commentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .blue
        label.alpha = 0.5
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

    func configure(with post: Board) {
//        profileImageView.image = post.profileImage
        usernameLabel.text = post.nickname
//        uploadTimeLabel.text = post.uploadTime
        titleLabel.text = post.title
        contentLabel.text = post.content
        likesLabel.text = "\(post.heartCount)"
        commentsLabel.text = "\(post.commentCount)"

//        if !post.images.isEmpty {
//                // 이미지가 있는 경우 첫 번째 이미지 표시
//                if let imageData = Data(base64Encoded: post.images[0]),
//                    let image = UIImage(data: imageData) {
//                    postImageView.image = image
//                }
//            } else {
//                postImageView.image = nil // 이미지 없을 경우 비움
//            }

//        likesImageView.isHidden = post.likes == 0
//        commentsImageView.isHidden = post.comments == 0
    }

    private func setupUI() {
        let userInfoStackView = UIStackView(arrangedSubviews: [profileImageView, usernameLabel, uploadTimeLabel])
        userInfoStackView.axis = .horizontal
        userInfoStackView.spacing = 8
        contentView.addSubview(userInfoStackView)
        userInfoStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.trailing.equalToSuperview().inset(16)
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
            make.bottom.equalToSuperview().inset(10)
        }

        contentView.addSubview(commentsLabel)
        commentsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(commentsImageView)
            make.leading.equalTo(commentsImageView.snp.trailing).offset(4)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
