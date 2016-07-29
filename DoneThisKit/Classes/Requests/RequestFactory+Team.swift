import Foundation
import Core

internal extension RequestFactory {
    
    // MARK: - Internal
    
    internal func teamIndex() -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "api/v2/teams").build()
    }
    
    internal func teamShow(hashId hashId: String) -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "api/v2/teams/\(hashId)").build()
    }
    
}
