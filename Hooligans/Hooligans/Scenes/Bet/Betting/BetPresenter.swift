//
//  BetPresenter.swift
//  Hooligans
//
//  Created by 정명곤 on 11/2/23.
//

import Foundation

protocol BetPresentationLogic: AnyObject {
    func BetResultPresentation()
}

final class BetPresenter {
    weak var viewController: BetViewController?
}

extension BetPresenter: BetPresentationLogic {
    func BetResultPresentation() {
        print()
    }
    
}
