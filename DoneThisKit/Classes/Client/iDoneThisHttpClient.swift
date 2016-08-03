import Foundation
import Core

class DoneThisHttpClient: JsonHttpClient {

    // MARK: - Init

    init() {
        super.init(requestDispatcher: UrlRequestDispatcher(), sessionAdapter: nil)
    }

}
