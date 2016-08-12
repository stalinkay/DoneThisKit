import Foundation
import CarambaKit

/// Session adapter that injects the session in a request to authenticate the user.
public class DoneThisSessionAdapter: Adapter<NSURLRequest, NSURLRequest> {

    // MARK: - Attributes

    private let sessionRepository: DoneThisSessionRepository

    // MARK: - Init

    /**
     Initializes the DoneThisSessionAdapter

     - parameter sessionRepository: repository where the adapter will take the session from.

     - returns: Initialized session adapter.
     */
    public init(sessionRepository: DoneThisSessionRepository = DoneThisSessionRepository()) {
        self.sessionRepository = sessionRepository
    }

    // MARK: - <Adapter>

    /**
     Adapt method that injects the token in the request headers.

     - parameter input: Input request to be adapted.

     - returns: Adapted request.
     */
    public override func adapt(input: NSURLRequest) -> NSURLRequest! {
        guard let session = self.sessionRepository.fetch() else { return input }
        var mutableRequest: NSMutableURLRequest = input.mutableCopy() as! NSMutableURLRequest
        var headers: [String: String] = mutableRequest.allHTTPHeaderFields ?? [:]
        headers["Authorization"] = "Token \(session.accessToken)"
        mutableRequest.allHTTPHeaderFields = headers
        return mutableRequest.copy() as! NSURLRequest
    }

}
