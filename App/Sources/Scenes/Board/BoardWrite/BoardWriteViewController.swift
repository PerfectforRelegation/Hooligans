
import UIKit
import SnapKit

protocol BoardWriteDisplayLogic: AnyObject {
    func displayA(viewModel: BoardListModels.PostContents.ViewModel, navigationController: UINavigationController?)
}

class BoardWriteViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var interactor: (BoardWriteBusinessLogic & BoardWriteDataStore)?

    private let navigationBar = NavigationBar(background: .systemIndigo, leftItem: UIImage(systemName: "chevron.left"), title: "게시글 작성")
    
    let uploadButton = UIButton()
    let titleTextField = UITextField()
    let contentTextField = UITextView()
    let addPhotoButton = UIButton()
    var scrollView: UIScrollView!
    var imageScrollView: UIScrollView!

    let activityIndicator: ActivityIndicator = {
        let indicator = ActivityIndicator(style: .large)
        return indicator
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.addKeyboardNotifications()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        setup()
        hideKeyboardWhenTappedAround()
        titleTextField.delegate = self
        contentTextField.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardNotifications()
    }
    
    
    func setupNavigationBar() {
//        navigationController?.navigationBar.barStyle = .default
//        navigationController?.navigationBar.barTintColor = .white

        // 뒤로가기
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .white

        // 글 쓰기
        let titleView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = "글 쓰기"
        titleLabel.textColor = .white
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        navigationItem.titleView = titleView

        // 등록
    }
    
    func setup() {
        let viewController = self
        let interactor = BoardWriteInteractor()
        let presenter = BoardWritePresenter()
//        let router = BoardWriteRouter()
        viewController.interactor = interactor
//        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
//        router.viewController = viewController
    }

    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(navigationBar)
        navigationBar.leftItem.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }

        titleTextField.placeholder = "제목"
        titleTextField.font = Font.semibold(size: 16)
        titleTextField.borderStyle = .none
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).offset(20)
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

        imageScrollView = UIScrollView()
        view.addSubview(imageScrollView)

        imageScrollView.snp.makeConstraints { make in
            make.top.equalTo(contentTextField.snp.top).offset(150)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(150)
        }

        // 사진 추가
        let addPhotoButton = UIButton()
        let addPhotoImage = UIImage(systemName: "camera.fill")
        addPhotoButton.tintColor = .systemIndigo
        addPhotoButton.setImage(addPhotoImage, for: .normal)
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        view.addSubview(addPhotoButton)
        addPhotoButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalToSuperview().offset(30)
            make.size.equalTo(CGSize(width: 35, height: 35))
        }
        
        let addPostButton = UIButton()
        addPostButton.tintColor = .systemIndigo
        addPostButton.setTitle("작성", for: .normal)
//        addPostButton.titleLabel?.font = Font.medium(size: 12)
        addPostButton.backgroundColor = .systemIndigo
        addPostButton.cornerRadius(10)
        addPostButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
        view.addSubview(addPostButton)
        addPostButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.trailing.equalToSuperview().inset(30)
            make.size.equalTo(CGSize(width: 45, height: 35))
        }
    }

    func addImageToScrollView(_ image: UIImage) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageScrollView.addSubview(imageView)

        let imageWidth = 90
        let spacing = 10
        let xPosition = (imageWidth + spacing) * imageScrollView.subviews.count
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(imageScrollView.snp.leading).offset(xPosition-290)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageWidth)
        }

        contentTextField.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-450)
        }
        let contentWidth = (imageWidth + spacing) * imageScrollView.subviews.count
        imageScrollView.contentSize = CGSize(width: contentWidth, height: 100)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            addImageToScrollView(selectedImage)
        }
        dismiss(animated: true) {
            self.activityIndicator.stop()
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) {
            // 사진보관함에서 취소 시에도 ActivityIndicator 정지
            self.activityIndicator.stop()
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

    @objc func backButtonTapped() {
        print("DEBUG :", "clickBack")
        navigationController?.popViewController(animated: true)
    }

    @objc func uploadButtonTapped() {
        print("DEBUG :", "clickUpload")
        if let title = self.titleTextField.text, let content = self.contentTextField.text {
            self.interactor?.addPost(request: BoardWriteModels.UploadPost.Request(title: title, content: content))
        }
    }

    @objc func addPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true) {
            self.activityIndicator.start(on: self.view)
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // 노티피케이션을 추가하는 메서드
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드가 나타날 때 코드
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let bottomInset = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets.bottom ?? 0
            let adjustedKeyboardHeight = keyboardHeight - bottomInset
            // bottomBaseView의 높이를 올려준다
            
            
            view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드가 사라졌을 때 코드
        
    }
}
