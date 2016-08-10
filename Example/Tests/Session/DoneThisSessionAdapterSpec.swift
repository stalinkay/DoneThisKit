import Foundation
import Quick
import Nimble
import CarambaKit

@testable import DoneThisKit

class DoneThisSessionAdapterSpec: QuickSpec {
    override func spec() {
        
        var subject: DoneThisSessionAdapter!
        var sessionRepository: DoneThisSessionRepository!
        
        beforeEach {
            sessionRepository = MockDoneThisSessionRepository()
            subject = DoneThisSessionAdapter(sessionRepository: sessionRepository)
        }
        
        describe("-adapt:") {
            var adaptedRequest: NSURLRequest!
            
            beforeEach {
                let inputRequest = NSURLRequest(URL: NSURL(string: "http://test")!)
                adaptedRequest = subject.adapt(inputRequest)
            }
            
            it("should add the token to the HTTP headers") {
                let header = adaptedRequest.allHTTPHeaderFields?["Authorization"]
                expect(header) == "Token token"
            }
            
        }
    }
}

// MARK: - Mock

private class MockDoneThisSessionRepository: DoneThisSessionRepository {
    
    private override func fetch() -> Session? {
        return Session(accessToken: "token", refreshToken: "")
    }
    
}