import Foundation
import SwiftyJSON

public struct User {
    
    public let emailAddress: String
    public let fullName: String
    public let hashId: String
    
    public init(json: JSON) throws {
        guard let emailAddress = json["email_address"].string else { throw MappingError.MissingAttribute("email_address") }
        guard let fullName = json["full_name"].string else { throw MappingError.MissingAttribute("full_name") }
        guard let hashId = json["hash_id"].string else { throw MappingError.MissingAttribute("hash_id") }
        self.emailAddress = emailAddress
        self.fullName = fullName
        self.hashId = hashId
    }
    
}
