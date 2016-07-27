import Foundation
import Core

class iDoneThisHttpClient: JsonHttpClient {
    
    // MARK: - Init
    
    init() {
        super.init(requestDispatcher: UrlRequestDispatcher(), sessionAdapter: nil)
    }
    
}
