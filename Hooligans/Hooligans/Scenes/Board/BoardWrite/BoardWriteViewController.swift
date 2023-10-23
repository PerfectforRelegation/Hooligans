
import UIKit
import SnapKit

protocol BoardWriteDisplayLogic: AnyObject {
    func displayA(viewModel: BoardListModels.PostContents.ViewModel, navigationController: UINavigationController?)
}

class BoardWriteViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {

    let uploadButton = UIBarButtonItem()
    let titleTextField = UITextField()
    let contentTextField = UITextView()
    let addPhotoButton = UIButton()
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()

        titleTextField.delegate = self
        contentTextField.delegate = self
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .white

        // 뒤로가기
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black

        // 글 쓰기
        let titleView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = "글 쓰기"
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        navigationItem.titleView = titleView

        // 등록
        uploadButton.title = "등록"
        uploadButton.style = .plain
        uploadButton.target = self
        uploadButton.action = #selector(uploadButtonTapped)

        navigationItem.rightBarButtonItems = [uploadButton]
    }


    func setupUI() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleTextField.placeholder = "제목"
        titleTextField.font = UIFont.boldSystemFont(ofSize: 16)
        titleTextField.borderStyle = .none
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        view.addSubview(separatorLine)
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }

        contentTextField.text = "내용을 입력하세요."
        contentTextField.font = UIFont.systemFont(ofSize: 16)
        contentTextField.textColor = .lightGray
        titleTextField.borderStyle = .none
        view.addSubview(contentTextField)
        contentTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-70)
        }

        // 사진 추가
        let addPhotoButton = UIButton()
        let addPhotoImage = UIImage(named: "cameraIcon")
        addPhotoButton.setImage(addPhotoImage, for: .normal)
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        view.addSubview(addPhotoButton)
        addPhotoButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalToSuperview().offset(30)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력하세요."
            textView.textColor = .lightGray
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "내용을 입력하세요." {
            textView.text = ""
            textView.textColor = .black // 입력 시작하면 검정색으로 변경
        }
    }

    // 제목에서 enter 누르면 contentTextField로 이동
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            contentTextField.becomeFirstResponder()
        }
        return true
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }




    @objc func backButtonTapped() {
        print("DEBUG :", "clickBack")
        navigationController?.popViewController(animated: true)
    }

    @objc func uploadButtonTapped() {
        print("DEBUG :", "clickUpload")
    }

    @objc func addPhotoButtonTapped() {
        print("DEBUG :", "clickPhoto")
    }
}
