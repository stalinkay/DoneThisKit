import Foundation
import Core

internal extension RequestFactory {
    
    // MARK: - Internal
    
    internal func entryIndex() -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "api/v2/entries").build()
    }
    
    internal func entryShow(hashId hashId: String) -> NSURLRequest {
        return self.urlRequestBuilder.get(path: "api/v2/entries/\(hashId)").build()
    }
    
    internal func create(body body: String, teamId: String, occurredOn: NSDate?, status: EntryStatus?) -> NSURLRequest {
        var parameters: [String: AnyObject] = [:]
        parameters["body"] = body
        parameters["team_id"] = teamId
        if let occurredOn = occurredOn {
            let dateFormater = NSDateFormatter()
            dateFormater.dateFormat = "yyyy-mm-dd"
            parameters["occurred_on"] = dateFormater.stringFromDate(occurredOn)
        }
        if let status = status {
            parameters["status"] = status.rawValue.lowercaseString
        }
        return self.urlRequestBuilder
            .post(path:"api/v2/entries")
            .withParameters(parameters)
            .build()
    }
    
    internal func entryUpdate(hashId hashId: String, body body: String, teamId: String, occurredOn: NSDate?, status: EntryStatus?) -> NSURLRequest {
        var parameters: [String: AnyObject] = [:]
        parameters["body"] = body
        parameters["team_id"] = teamId
        if let occurredOn = occurredOn {
            let dateFormater = NSDateFormatter()
            dateFormater.dateFormat = "yyyy-mm-dd"
            parameters["occurred_on"] = dateFormater.stringFromDate(occurredOn)
        }
        if let status = status {
            parameters["status"] = status.rawValue.lowercaseString
        }
        return self.urlRequestBuilder
            .post(path:"api/v2/entries/\(hashId)")
            .withParameters(parameters)
            .build()
    }
    
    internal func entryDelete(hashId hashId: String) -> NSURLRequest {
        return self.urlRequestBuilder
            .delete(path:"api/v2/entries/\(hashId)")
            .build()
    }
    
}
