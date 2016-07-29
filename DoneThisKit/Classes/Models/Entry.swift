import Foundation
import SwiftyJSON

public enum EntryStatus: String, Equatable {
    case Goal
    case Blocked
    case Done
}

public struct Entry {

    // MARK: - Attributes

    public let body: String
    public let createdAt: NSDate
    public let updatedAt: NSDate
    public let ocurredOn: NSDate?
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
        guard let status = EntryStatus(rawValue: statusString) else { throw MappingError.WrongValue("status") }
        guard let hashId = json["hash_id"].string else { throw MappingError.MissingAttribute("hash_id") }
        let ocurredOnString = json["occurred_on"].string
        let completedOnString = json["completed_on"].string
        let archivedAtString = json["archived_at"].string
        self.body = body
        self.createdAt = DateFormatters.main.dateFromString(createdAtString)!
        self.updatedAt = DateFormatters.main.dateFromString(updatedAtString)!
        self.status = status
        self.hashId = hashId
        self.team = try Team(json: json["team"])
        self.user = try User(json: json["user"])
        self.ocurredOn = (ocurredOnString != nil) ? DateFormatters.main.dateFromString(ocurredOnString!)! : nil
        self.completedOn = (completedOnString != nil) ? DateFormatters.main.dateFromString(completedOnString!)! : nil
        self.archivedAt = (archivedAtString != nil) ? DateFormatters.main.dateFromString(archivedAtString!)! : nil
    }
}
