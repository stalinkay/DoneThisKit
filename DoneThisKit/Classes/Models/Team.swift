import Foundation
import SwiftyJSON

/**
 *  Team
 */
public struct Team: Equatable {

    // MARK: - Attributes

    public let name: String
    public let hashId: String
    public let createdAt: NSDate?
    public let updatedAt: NSDate?

    // MARK: - Init

    public init(json: JSON) throws {
        guard let name = json["name"].string else { throw MappingError.MissingAttribute("name") }
        guard let hashId = json["hash_id"].string else { throw MappingError.MissingAttribute("hash_id") }
        let createdAtString = json["created_at"].string
        let updatedAtString = json["updated_at"].string
        self.name = name
        self.hashId = hashId
        self.createdAt = (createdAtString != nil) ? DateFormatters.main.dateFromString(createdAtString!) : nil
        self.updatedAt = (updatedAtString != nil) ? DateFormatters.main.dateFromString(updatedAtString!) : nil
    }

}

public func == (lhs: Team, rhs: Team) -> Bool {
    return lhs.hashId == rhs.hashId
}
