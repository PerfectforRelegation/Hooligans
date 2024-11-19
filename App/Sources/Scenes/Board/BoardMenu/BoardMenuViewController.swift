import UIKit
import SnapKit

class BoardMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

//        let writeButton = UIButton()
//        writeButton.setTitle("글 쓰기", for: .normal)
//        writeButton.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)
//        writeButton.layer.cornerRadius = 20
//        writeButton.backgroundColor = UIColor.systemIndigo
//        writeButton.alpha = 0.8
//        view.addSubview(writeButton)

        let deleteBookmarkButton = UIButton()
        deleteBookmarkButton.setTitle("스크랩 목록", for: .normal)
        deleteBookmarkButton.addTarget(self, action: #selector(deleteBookmarkButtonTapped), for: .touchUpInside)
        deleteBookmarkButton.layer.cornerRadius = 20
        deleteBookmarkButton.backgroundColor = UIColor.systemIndigo
        deleteBookmarkButton.alpha = 0.8
        view.addSubview(deleteBookmarkButton)

        let cancelButton = UIButton()
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.layer.cornerRadius = 20
        cancelButton.backgroundColor = UIColor.systemIndigo
        cancelButton.alpha = 0.8
        view.addSubview(cancelButton)

//        writeButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(30)
//            make.width.equalTo(310)
//            make.height.equalTo(40)
//        }

        deleteBookmarkButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //make.top.equalTo(writeButton.snp.bottom).offset(20)
            make.top.equalToSuperview().offset(80)
            make.width.equalTo(310)
            make.height.equalTo(40)
        }

        cancelButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(deleteBookmarkButton.snp.bottom).offset(20)
            make.width.equalTo(310)
            make.height.equalTo(40)
        }
    }

    @objc func writeButtonTapped() {
        let boardWriteViewController = BoardWriteViewController()
        navigationController?.pushViewController(boardWriteViewController, animated: true)
    }


    @objc func deleteBookmarkButtonTapped() {

    }

    @objc func cancelButtonTapped() {
        if let presentingVC = presentingViewController as? BoardListViewController {
            presentingVC.view.alpha = 1.0
        }
        dismiss(animated: true, completion: nil)
    }
}
