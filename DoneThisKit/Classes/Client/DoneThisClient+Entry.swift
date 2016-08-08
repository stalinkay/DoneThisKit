import Foundation
import RxSwift
import SwiftyJSON

extension DoneThisClient {

    public func entryIndex() -> Observable<[Entry]> {
        return self.request(self.requestFactory.entryIndex()).map { try $0.0.arrayValue.map { try Entry(json: $0) } }
    }

    public func entryShow(hashId hashId: String) -> Observable<Entry> {
        return self.request(self.requestFactory.teamShow(hashId: hashId)).map { try Entry(json: $0.0) }
    }

    public func create(body body: String, teamId: String, occurredOn: NSDate?, status: EntryStatus?) -> Observable<Entry> {
        let request = self.requestFactory.entryCreate(body: body, teamId: teamId, occurredOn: occurredOn, status: status)
        return self.request(request).map { try Entry(json: $0.0) }
    }

    public func entryUpdate(hashId hashId: String, body body: String, teamId: String, occurredOn: NSDate?, status: EntryStatus?) -> Observable<Entry> {
        let request = self.requestFactory.entryUpdate(hashId: hashId, body: body, teamId: teamId, occurredOn: occurredOn, status: status)
        return self.request(request).map { try Entry(json: $0.0) }
    }

    public func entryDelete(hashId hashId: String) -> Observable<JSON> {
        let request = self.requestFactory.entryDelete(hashId: hashId)
        return self.request(request).map { $0.0 }
    }

}
