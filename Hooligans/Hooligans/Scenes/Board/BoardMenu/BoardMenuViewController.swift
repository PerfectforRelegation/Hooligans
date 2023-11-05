
import UIKit

class BoardMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let writeButton = UIButton()
        writeButton.setTitle("글 쓰기", for: .normal)
        writeButton.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)
        view.addSubview(writeButton)

        let deleteBookmarkButton = UIButton()
        deleteBookmarkButton.setTitle("스크랩 목록", for: .normal)
        deleteBookmarkButton.addTarget(self, action: #selector(deleteBookmarkButtonTapped), for: .touchUpInside)
        view.addSubview(deleteBookmarkButton)

        let cancelButton = UIButton()
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        view.addSubview(cancelButton)

        writeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }

        deleteBookmarkButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(writeButton.snp.bottom).offset(20)
        }

        cancelButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(deleteBookmarkButton.snp.bottom).offset(20)
        }
    }

    @objc func writeButtonTapped() {

    }

    @objc func deleteBookmarkButtonTapped() {

    }

    @objc func cancelButtonTapped() {
        // 이전 화면 투명도 복원
        if let presentingVC = presentingViewController as? BoardListViewController {
            presentingVC.view.alpha = 1.0
        }
        dismiss(animated: true, completion: nil)
    }
}
