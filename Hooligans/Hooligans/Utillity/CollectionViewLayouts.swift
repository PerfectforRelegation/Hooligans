//
//  ChatCollectionViewLayout.swift
//  Hooligans
//
//  Created by 정명곤 on 10/19/23.
//

import Foundation
import UIKit

struct CollectionViewLayouts {
    
    // MARK: - Main CollectionView Layout
    enum Main: CaseIterable {
        case fixtureLayout
        
        func section() -> NSCollectionLayoutSection {
            switch self {
            case .fixtureLayout:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .fractionalHeight(0.21))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 8, bottom: 16, trailing: 8)
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(20)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading)
                ]
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                
                return section
            }
            
        }
    }
    
    // MARK: - Chat CollectionView Layout
    enum Chat: CaseIterable {
        case pageItem
        case containerView
        
        func section() -> NSCollectionLayoutSection {
            switch self {
            case .pageItem:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(20))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(10)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading)
                ]
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            case .containerView:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(10)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading)
                ]
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                return section
            }
            
        }
    }
    
}

extension UICollectionViewCompositionalLayout {
    
}
