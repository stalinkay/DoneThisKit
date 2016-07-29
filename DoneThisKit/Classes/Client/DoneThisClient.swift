import Foundation
import Core

class DoneThisClient: JsonHttpClient {

    // MARK: - Attributes
    
    internal let requestFactory: RequestFactory
    
    // MARK: - Init
    
    public init(sessionAdapter: Adapter<NSURLRequest, NSURLRequest>? = nil,
                requestFactory: RequestFactory = RequestFactory.instance) {
        self.requestFactory = requestFactory
        super.init(sessionAdapter: sessionAdapter)

    }
    
    
}