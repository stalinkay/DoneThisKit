import Foundation
import RxSwift

// MARK: - DoneThisClient Extension adding Entry endpoints.
extension DoneThisClient {

    /**
     Fetches all the user teams.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func teamIndex() -> Observable<[Team]> {
        return self.request(self.requestFactory.teamIndex()).map { try $0.0.arrayValue.map { try Team(json: $0) } }
    }

    /**
     Fetches a given team.

     - parameter hashId: Team hash identifier.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func teamShow(hashId hashId: String) -> Observable<Team> {
        return self.request(self.requestFactory.teamShow(hashId: hashId)).map { try Team(json: $0.0) }
    }

}
