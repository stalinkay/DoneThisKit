import Foundation
import CarambaKit

public class DoneThisClient: JsonHttpClient {

    // MARK: - Attributes

    internal let requestFactory: RequestFactory

    // MARK: - Init

    public init(sessionAdapter: Adapter<NSURLRequest, NSURLRequest>? = DoneThisSessionAdapter()) {
        self.requestFactory = RequestFactory.instance
        super.init(sessionAdapter: sessionAdapter)
    }

}