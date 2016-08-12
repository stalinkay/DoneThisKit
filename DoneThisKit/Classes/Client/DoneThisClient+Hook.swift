import Foundation
import RxSwift
import SwiftyJSON

// MARK: - DoneThisClient Extension adding Entry endpoints.
extension DoneThisClient {

    /**
     Fetches the user hooks.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func hookIndex() -> Observable<[Hook]> {
        return self.request(self.requestFactory.hookIndex()).map { try $0.0.arrayValue.map { try Hook(json: $0) } }
    }

    /**
     Fetches the given hook.

     - parameter identifier: Hook identifier.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func hookShow(identifier identifier: String) -> Observable<Hook> {
        return self.request(self.requestFactory.hookShow(identifier: identifier)).map { try Hook(json: $0.0) }
    }

    /**
     Updates a hook.

     - parameter identifier: Hook identifier.
     - parameter targetUrl:  Hook target url.
     - parameter teamId:     Hook team identifier.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    public func hookUpdate(identifier identifier: String, targetUrl: String?, teamId: String?) -> Observable<Hook> {
        return self.request(self.requestFactory.hookUpdate(identifier: identifier, targetUrl: targetUrl, teamId: teamId))
            .map { try Hook(json: $0.0) }
    }

    /**
     Deletes a hook.

     - parameter identifier: Hook identifier.

     - returns: Observable that executes the request when someone subscribes to it.
     */
    internal func hookDelete(identifier identifier: String) -> Observable<JSON> {
        return self.request(self.requestFactory.hookDelete(identifier: identifier)).map { $0.0 }
    }

}
