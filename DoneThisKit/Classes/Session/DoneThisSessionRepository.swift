import Foundation
import CarambaKit

/// iDoneThis session repository that provides the session from the Keychain.
public class DoneThisSessionRepository: SessionRepository {

    // MARK: - Init

    /**
     Initializes the session repository with the repository name. This repository name is used as a identifier to fetch the session from the Keychain.

     - parameter name: Repository name.

     - returns: Initialized session repository.
     */
    public override init(name: String = "iDoneThis") {
        super.init(name: name)
    }

}
