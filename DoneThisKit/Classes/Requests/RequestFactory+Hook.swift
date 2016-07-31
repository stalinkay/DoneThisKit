import Foundation
import Core

internal extension RequestFactory {

    internal func hookIndex() -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "/api/v2/hooks").build()
    }
    
    internal func hookShow(id id: String) -> NSURLRequest {
        return urlRequestBuilder.get(path: "/api/v2/hooks/\(id)").build()
    }
    
    internal func hookCreate(targetUrl targetUrl: String, teamId: String) -> NSURLRequest {
        return self.urlRequestBuilder
            .post(path: "/api/v2/hooks")
            .withParameters(["target_url": targetUrl, "team_id": teamId])
            .build()
    }
    
    internal func hookUpdate(id id: String, targetUrl: String?, teamId: String?) -> NSURLRequest {
        var parameters: [String: AnyObject] = [:]
        if let targetUrl = targetUrl {
            parameters["target_url"] = targetUrl
        }
        if let teamId = teamId {
            parameters["team_id"] = teamId
        }
        return self.urlRequestBuilder
            .post(path: "/api/v2/hooks/\(id)")
            .withBody(parameters)
            .build()
    }
    
    internal func hookDelete(id id: String) -> NSURLRequest {
        return urlRequestBuilder.delete(path: "/api/v2/hooks/\(id)").build()
    }
    
}