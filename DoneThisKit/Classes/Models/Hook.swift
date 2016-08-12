import Foundation
import SwiftyJSON

/**
 *  Hook
 */
public struct Hook: Equatable {

    // MARK: - Attributes

    public let identifier: Int
    public let targetUrl: String
    public let createdAt: NSDate
    public let updatedAt: NSDate?
    public let team: Team
    public let user: User

    // MARK: - Init

    internal init(json: JSON) throws {
        guard let identifier = json["id"].int else { throw MappingError.MissingAttribute("id") }
        guard let targetUrl = json["target_url"].string else { throw MappingError.MissingAttribute("target_url") }
        guard let createdAtString = json["created_at"].string else { throw MappingError.MissingAttribute("created_at") }
        guard let updatedAtString = json["updated_at"].string else { throw MappingError.MissingAttribute("updated_at") }
        self.identifier = identifier
        self.targetUrl = targetUrl
        self.team = try Team(json: json["team"])
        self.user = try User(json: json["user"])
        self.createdAt = DateFormatters.main.dateFromString(createdAtString)!
        self.updatedAt = DateFormatters.main.dateFromString(updatedAtString)!
    }

}

public func == (lhs: Hook, rhs: Hook) -> Bool {
    return lhs.identifier == rhs.identifier
}
