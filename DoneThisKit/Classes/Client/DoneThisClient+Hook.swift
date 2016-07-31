import Foundation
import RxSwift
import SwiftyJSON

extension DoneThisClient {
    
    public func hookIndex() -> Observable<[Hook]> {
        return self.request(self.requestFactory.hookIndex()).map { try $0.0.arrayValue.map { try Hook(json: $0) } }
    }
    
    public func hookShow(id id: String) -> Observable<Hook> {
        return self.request(self.requestFactory.hookShow(id: id)).map { try Hook(json: $0.0) }
    }
    
    public func hookUpdate(id id: String, targetUrl: String?, teamId: String?) -> Observable<Hook> {
        return self.request(self.requestFactory.hookUpdate(id: id, targetUrl: targetUrl, teamId: teamId))
            .map { try Hook(json: $0.0) }
    }
    
    internal func hookDelete(id id: String) -> Observable<JSON> {
        return self.request(self.requestFactory.hookDelete(id: id)).map { $0.0 }
    }
    
}