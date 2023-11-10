//
//  Item.swift
//  Hooligans
//
//  Created by 정명곤 on 11/6/23.
//

import Foundation

struct Item: Hashable {
    let data: Any
    let identifier: UUID
    
    init(data: Any, identifier: UUID = UUID()) {
        self.data = data
        self.identifier = identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
