import Foundation
import Core

public class DoneThisClient: JsonHttpClient {

    // MARK: - Attributes
    
    internal let requestFactory: RequestFactory
    
    // MARK: - Init
    
    internal init(sessionAdapter: Adapter<NSURLRequest, NSURLRequest>? = nil,
                requestFactory: RequestFactory = RequestFactory.instance) {
        self.requestFactory = requestFactory
        super.init(sessionAdapter: sessionAdapter)
    }
    
    public init() {
        self.requestFactory = RequestFactory.instance
        super.init()
    }
    
}
