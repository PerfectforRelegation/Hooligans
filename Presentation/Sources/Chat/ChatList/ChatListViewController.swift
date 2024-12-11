//
//  ChatPageViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 10/19/23.
//

import UIKit


public final class ChatListViewController: UIViewController {
    
    // MARK: - View Initialize
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return Layouts.Chat.allCases[section].section()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.showsVerticalScrollIndicator = false
      collectionView.backgroundColor = .brown
        //        collectionView.isScrollEnabled = false
        
        return collectionView
    }()

    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    private func registerCells() {
//        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.identifier)
//        collectionView.register(TabItemCell.self, forCellWithReuseIdentifier: TabItemCell.identifier)
//        collectionView.register(TeamChatRoomCell.self, forCellWithReuseIdentifier: TeamChatRoomCell.identifier)
    }
    
    
}

extension ChatListViewController {
    private func setupView() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension ChatListViewController: UICollectionViewDelegate {
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
  public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1
        }
    }
}

