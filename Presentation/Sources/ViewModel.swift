//
//  ViewModel.swift
//  Presentation
//
//  Created by 정명곤 on 10/29/24.
//  Copyright © 2024 CleanArchitecture. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain


public final class ViewModel {
  private let useCase: UseCase
  private let disposeBag = DisposeBag()

  struct Input {
    let tapButton: Observable<Void>
  }

  struct Output {
//    let navigateToAuthCoordinator: Observable<Void>
  }

  public let navigateToAuthCoordinator: PublishRelay<Void> = PublishRelay()

  public init(useCase: UseCase) {
    self.useCase = useCase
  }

  func transform(from input: Input) -> Output {

    input.tapButton
      .bind(to: navigateToAuthCoordinator)
      .disposed(by: disposeBag)

//    let movieList = input.refresh
//                .flatMap { [weak self] _ -> Observable<[Movie]> in
//                    guard let self = self else { return Observable.just([]) }
//                  return useCase.fetchMovie()
//                }

    return Output()
  }

}
