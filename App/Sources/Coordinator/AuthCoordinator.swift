//
//  SignInCoordinator.swift
//  Hooligans
//
//  Created by 정명곤 on 12/10/24.
//

import UIKit
import Presentation
import Domain
import Data

final class AuthCoordinator: Coordinator {
  // MARK: - Property
  var parent: Coordinator?
  var childeren: [Coordinator] = []
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  // MARK: - Start
  func start() {

    let repository = RepositoryImpl()               // Data layer
    let useCase = UseCase(repository: repository)   // Domain layer
    let viewModel = ViewModel(useCase: useCase)     // Presentation layer
    let viewController = ViewController(viewModel: viewModel)

    navigationController.pushViewController(viewController, animated: true)
  }

}
