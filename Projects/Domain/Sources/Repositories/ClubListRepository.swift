//
//  Repository.swift
//  Domain
//
//  Created by 정명곤 on 10/30/24.
//

import UIKit
import RxSwift

public protocol ClubListRepository {

  init()

  func fetchClubList() -> Observable<[Club]>

//  func addAlarm(title: String,
//                body: String,
//                at date: DateComponents) -> Observable<[Alarm]>
//
//  func editAlarm(withIdentifier identifier: UUID,
//                 title: String,
//                 body: String,
//                 at date: DateComponents) -> Observable<[Alarm]>
//
//  func removeAlarms(with identifiers: [String]) -> Observable<[Alarm]>

}

extension ClubListRepository {
//  init() { }
}
