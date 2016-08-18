import Foundation
import CarambaKit

internal extension RequestFactory {

    // MARK: - Internal

    internal func entryIndex(teamId teamId: String) -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "api/v2/teams/\(teamId)/entries")
            .build(bodyEncoding: UrlParameterEncoding.URL)
    }

    internal func entryShow(hashId hashId: String) -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "api/v2/entries/\(hashId)").build(bodyEncoding: UrlParameterEncoding.URL)
    }

    internal func entryCreate(body body: String, teamId: String, status: EntryStatus?) -> NSURLRequest {
        var parameters: [String: AnyObject] = [:]
        parameters["body"] = body
        parameters["team_id"] = teamId
        if let status = status {
            parameters["status"] = status.rawValue.lowercaseString
        }
        return self.urlRequestBuilder
            .post(path:"api/v2/entries")
            .withParameters(parameters)
            .build(parameterEncoding: UrlParameterEncoding.URLEncodedInURL)
    }

    internal func entryUpdate(hashId hashId: String, body body: String, teamId: String, status: EntryStatus?) -> NSURLRequest {
        var parameters: [String: AnyObject] = [:]
        parameters["body"] = body
        parameters["team_id"] = teamId
        if let status = status {
            parameters["status"] = status.rawValue.lowercaseString
        }
        return self.urlRequestBuilder
            .post(path:"api/v2/entries/\(hashId)")
            .withBody(parameters)
            .build()
    }

    internal func entryDelete(hashId hashId: String) -> NSURLRequest {
        return self.urlRequestBuilder
            .delete(path:"api/v2/entries/\(hashId)")
            .build()
    }

}
