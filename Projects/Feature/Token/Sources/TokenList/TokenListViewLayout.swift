import UIKit


struct TokenListViewLayout {
  enum Section: Int, CaseIterable {
    case tokenList

    func section() -> NSCollectionLayoutSection {
      switch self {
      case .tokenList:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 5)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)

        return section
      }
    }
  }
}
