import Foundation
import CarambaKit

public class DoneThisSessionAdapter: Adapter<NSURLRequest, NSURLRequest> {

    // MARK: - Attributes

    private let sessionRepository: DoneThisSessionRepository

    // MARK: - Init

    public init(sessionRepository: DoneThisSessionRepository = DoneThisSessionRepository()) {
        self.sessionRepository = sessionRepository
    }

    // MARK: - <Adapter>

    public override func adapt(input: NSURLRequest) -> NSURLRequest! {
        guard let session = self.sessionRepository.fetch() else { return input }
        var mutableRequest: NSMutableURLRequest = input.mutableCopy() as! NSMutableURLRequest
        var headers: [String: String] = mutableRequest.allHTTPHeaderFields ?? [:]
        headers["Authorization"] = "Token \(session.accessToken)"
        mutableRequest.allHTTPHeaderFields = headers
        return mutableRequest.copy() as! NSURLRequest
    }

}
