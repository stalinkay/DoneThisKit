import Foundation
import RxSwift
import SwiftyJSON

// MARK: - DoneThisClient Extension adding Entry endpoints.
extension DoneThisClient {

    /**
     Fetches the entries from a given Team.

     - parameter teamId: Team identifier.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func entryIndex(teamId teamId: String) -> Observable<[Entry]> {
        return self.request(self.requestFactory.entryIndex(teamId: teamId)).map { try $0.0.arrayValue.map { try Entry(json: $0) } }
    }

    /**
     Fetches the entry with a given identifier.

     - parameter hashId: Entry hash id.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func entryShow(hashId hashId: String) -> Observable<Entry> {
        return self.request(self.requestFactory.teamShow(hashId: hashId)).map { try Entry(json: $0.0) }
    }

    /**
     Creates an entry.

     - parameter body:       Entry body.
     - parameter teamId:     Entry team identifier.
     - parameter occurredOn: Entry date when it occurred.
     - parameter status:     Entry status.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func entryCreate(body body: String, teamId: String, occurredOn: NSDate?, status: EntryStatus?) -> Observable<Entry> {
        let request = self.requestFactory.entryCreate(body: body, teamId: teamId, occurredOn: occurredOn, status: status)
        return self.request(request).map { try Entry(json: $0.0) }
    }

    /**
     Updates an entry.

     - parameter hashId:     Entry hash id.
     - parameter body:       Entry body.
     - parameter teamId:     Entry team identifier.
     - parameter occurredOn: Entry date when it occurred.
     - parameter status:     Entry status.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func entryUpdate(hashId hashId: String, body body: String, teamId: String, occurredOn: NSDate?, status: EntryStatus?) -> Observable<Entry> {
        let request = self.requestFactory.entryUpdate(hashId: hashId, body: body, teamId: teamId, occurredOn: occurredOn, status: status)
        return self.request(request).map { try Entry(json: $0.0) }
    }

    /**
     Deletes an entry.

     - parameter hashId: Entry hash id.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func entryDelete(hashId hashId: String) -> Observable<JSON> {
        let request = self.requestFactory.entryDelete(hashId: hashId)
        return self.request(request).map { $0.0 }
    }

}
