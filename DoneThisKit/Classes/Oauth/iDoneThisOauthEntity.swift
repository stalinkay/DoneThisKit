import Foundation
import SwiftyJSON
import CarambaKit

public struct DoneThisOauthEntity: Oauth2Entity {

    // MARK: - <Oauth2Entity>

    public func authorizationUrl() -> String {
        //TODO
        return "test"
    }

    public func authenticationRequestFromUrl(url: String) -> NSURLRequest? {
        //TODO
        return NSURLRequest(URL: NSURL(string: url)!)
    }

    public func sessionFromJSON(response: JSON) throws -> Oauth2Session {
        //TODO
        return Oauth2Session(accessToken: "", refreshToken: "")
    }

}
