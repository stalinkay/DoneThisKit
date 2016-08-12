import Foundation
import SwiftyJSON
import CarambaKit

/**
 *  iDoneThis Oauth Entity
 */
public struct DoneThisOauthEntity: Oauth2Entity {

    // MARK: - <Oauth2Entity>

    /**
     Returns the authorization url that triggers the Oauth2 flow.

     - returns: Authorization URL.
     */
    public func authorizationUrl() -> String {
        //TODO
        return "test"
    }

    /**
     Returns the authentication request from the authorization URL that has been opened in the browsesr.

     - parameter url: Redirection URL once the user signs in.

     - returns: Request for authenticating the user against the API.
     */
    public func authenticationRequestFromUrl(url: String) -> NSURLRequest? {
        //TODO
        return NSURLRequest(URL: NSURL(string: url)!)
    }

    /**
     Extracts the session from the authentication JSON response.

     - parameter response: Authentication JSON response.

     - throws: Throws an error if the session cannot be found.

     - returns: Session from the response.
     */
    public func sessionFromJSON(response: JSON) throws -> Oauth2Session {
        //TODO
        return Oauth2Session(accessToken: "", refreshToken: "")
    }

}
