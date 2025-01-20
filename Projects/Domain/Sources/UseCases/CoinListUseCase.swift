import UIKit
import RxSwift


public final class CoinListUseCase {
  private let repository: ClubListRepository

  public init(repository: ClubListRepository) {
    self.repository = repository
  }

  public func getClubList() -> Observable<[Club]> {
    return repository.fetchClubList()
  }
//
//  public func addAlarm(title: String,
//                       body: String,
//                       at date: DateComponents) -> Observable<[Alarm]> {
//    return repository
//      .addAlarm(title:s title, body: body, at: date)
//      .concat(repository.fetchAlarmList())
//  }
//
//  public func editAlarm(withIdentifier identifier: UUID,
//                        title: String,
//                        body: String,
//                        at date: DateComponents) -> Observable<[Alarm]> {
//    return repository
//      .editAlarm(withIdentifier: identifier, title: title, body: body, at: date)
//      .concat(repository.fetchAlarmList())
//  }
//
//  public func removeAlarm() -> Observable<Bool> {
//    return Observable.just(true)
//  }
}
