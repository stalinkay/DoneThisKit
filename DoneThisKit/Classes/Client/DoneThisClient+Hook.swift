import Foundation
import RxSwift
import SwiftyJSON

extension DoneThisClient {

    public func hookIndex() -> Observable<[Hook]> {
        return self.request(self.requestFactory.hookIndex()).map { try $0.0.arrayValue.map { try Hook(json: $0) } }
    }

    public func hookShow(identifier identifier: String) -> Observable<Hook> {
        return self.request(self.requestFactory.hookShow(identifier: identifier)).map { try Hook(json: $0.0) }
    }

    public func hookUpdate(identifier identifier: String, targetUrl: String?, teamId: String?) -> Observable<Hook> {
        return self.request(self.requestFactory.hookUpdate(identifier: identifier, targetUrl: targetUrl, teamId: teamId))
            .map { try Hook(json: $0.0) }
    }

    internal func hookDelete(identifier identifier: String) -> Observable<JSON> {
        return self.request(self.requestFactory.hookDelete(identifier: identifier)).map { $0.0 }
    }

}
