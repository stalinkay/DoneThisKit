import Foundation
import Core

internal extension RequestFactory {

    internal func hookIndex() -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "/api/v2/hooks").build()
    }

    internal func hookShow(identifier identifier: String) -> NSURLRequest {
        return urlRequestBuilder.get(path: "/api/v2/hooks/\(identifier)").build()
    }

    internal func hookCreate(targetUrl targetUrl: String, teamId: String) -> NSURLRequest {
        return self.urlRequestBuilder
            .post(path: "/api/v2/hooks")
            .withParameters(["target_url": targetUrl, "team_id": teamId])
            .build()
    }

    internal func hookUpdate(identifier identifier: String, targetUrl: String?, teamId: String?) -> NSURLRequest {
        var parameters: [String: AnyObject] = [:]
        if let targetUrl = targetUrl {
            parameters["target_url"] = targetUrl
        }
        if let teamId = teamId {
            parameters["team_id"] = teamId
        }
        return self.urlRequestBuilder
            .post(path: "/api/v2/hooks/\(identifier)")
            .withBody(parameters)
            .build()
    }

    internal func hookDelete(identifier identifier: String) -> NSURLRequest {
        return urlRequestBuilder.delete(path: "/api/v2/hooks/\(identifier)").build()
    }

}
