import Foundation
import SwiftyJSON

/**
 Entry status.

 - Goal:    To be completed.
 - Blocked: It's blocked.
 - Done:    Completed.
 */
public enum EntryStatus: String, Equatable {
    case Goal
    case Blocked
    case Done
}

/**
 *  Entry
 */
public struct Entry: Equatable {

    // MARK: - Attributes

    public let body: String
    public let createdAt: NSDate
    public let updatedAt: NSDate
    public let occurredOn: NSDate?
    public let status: EntryStatus
    public let hashId: String
    public let completedOn: NSDate?
    public let archivedAt: NSDate?
    public let team: Team
    public let user: User

    // MARK: - Init

    public init(json: JSON) throws {
        guard let body = json["body"].string else { throw MappingError.MissingAttribute("body") }
        guard let createdAtString = json["created_at"].string else { throw MappingError.MissingAttribute("created_at") }
        guard let updatedAtString = json["updated_at"].string else { throw MappingError.MissingAttribute("updated_at") }
        guard let statusString = json["status"].string else { throw MappingError.MissingAttribute("status") }
        guard let status = EntryStatus(rawValue: statusString.capitalizedString) else { throw MappingError.WrongValue("status") }
        guard let hashId = json["hash_id"].string else { throw MappingError.MissingAttribute("hash_id") }
        let occurredOnString = json["occurred_on"].string
        let completedOnString = json["completed_on"].string
        let archivedAtString = json["archived_at"].string
        self.body = body
        self.createdAt = DateFormatters.main.dateFromString(createdAtString)!
        self.updatedAt = DateFormatters.main.dateFromString(updatedAtString)!
        self.status = status
        self.hashId = hashId
        self.team = try Team(json: json["team"])
        self.user = try User(json: json["user"])
        self.occurredOn = (occurredOnString != nil) ? DateFormatters.main.dateFromString(occurredOnString!)! : nil
        self.completedOn = (completedOnString != nil) ? DateFormatters.main.dateFromString(completedOnString!)! : nil
        self.archivedAt = (archivedAtString != nil) ? DateFormatters.main.dateFromString(archivedAtString!)! : nil
    }
}

public func == (lhs: Entry, rhs: Entry) -> Bool {
    return lhs.hashId == rhs.hashId
}
