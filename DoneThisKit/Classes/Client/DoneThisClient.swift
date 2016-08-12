import Foundation
import CarambaKit

/// DoneThis API Client that fetches data from the iDoneThis API and maps the results into Swift inmutable models.
public class DoneThisClient: JsonHttpClient {

    // MARK: - Attributes

    internal let requestFactory: RequestFactory

    // MARK: - Init

    /**
     Initializes the client.

     - parameter sessionAdapter: Adapter that allows the developer to provide more data in the requests.

     - returns: Initialized DoneThisClient instance.
     */
    public init(sessionAdapter: Adapter<NSURLRequest, NSURLRequest>? = DoneThisSessionAdapter()) {
        self.requestFactory = RequestFactory.instance
        super.init(sessionAdapter: sessionAdapter)
    }

}
