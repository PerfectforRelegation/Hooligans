
import UIKit
import SnapKit

protocol BoardSearchDisplayLogic: AnyObject {
    func displayA(viewModel: BoardListModels.PostContents.ViewModel, navigationController: UINavigationController?)
}

class BoardSearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    var posts: [Post] = []
    let searchBar = UISearchBar()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        BackButton()
    }

    func setupUI() {
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력하세요."
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .white
        navigationItem.titleView = searchBar

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // 키보드 숨기기
        if let searchText = searchBar.text?.lowercased() {

//            posts = mySearchFunction(searchText)
//            tableView.reloadData()
        }
    }

//    func mySearchFunction(_ searchText: String) -> [Post] {
//
//        let filteredPosts = posts.filter { post in
//            return post.title.lowercased().contains(searchText) || post.content.lowercased().contains(searchText)
//        }
//        return filteredPosts
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell

        let post = posts[indexPath.row]
//        cell.configure(with: post)
        cell.likesImageView.image = UIImage(named: "likeIcon")

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedPost = posts[indexPath.row]
//        let boardDetailViewController = BoardDetailViewController(board: selectedPost)
////        boardDetailViewController.selectedPost = selectedPost
//        navigationController?.pushViewController(boardDetailViewController, animated: true)
    }

    func BackButton() {
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .systemIndigo
    }

    @objc func backButtonTapped() {
        print("DEBUG :", "clickBack")
        navigationController?.popViewController(animated: true)
    }
}
