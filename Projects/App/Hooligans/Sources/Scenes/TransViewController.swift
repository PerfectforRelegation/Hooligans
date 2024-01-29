//
//  TransViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 11/10/23.
//

import UIKit

class TransViewController: UIViewController {
    private var viewController: UIViewController?
    
    init(to viewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.viewController = viewController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewController = viewController {
            viewController.navigationController?.isNavigationBarHidden = true
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
