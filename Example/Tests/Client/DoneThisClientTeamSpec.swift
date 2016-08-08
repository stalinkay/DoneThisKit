import Foundation
import Quick
import Nimble
import Mockingjay

@testable import DoneThisKit

class DoneThisClientTeamSpec: QuickSpec {
    override func spec() {
        
        var subject: DoneThisClient!
        
        beforeEach {
            subject = DoneThisClient()
        }
        
        afterEach {
            self.removeAllStubs()
        }
        
        describe("-teamIndex") {
            it("should return the response mapped if there's a response from the API") {
//                waitUntil(action: { (done) in
//                    
//                })
            }
            
            it("should return an error if the API returned an error") {
                let error = NSError(domain: "", code: -1, userInfo: nil)
                self.stub(uri(subject.requestFactory.teamIndex().URL!.absoluteString), builder: failure(error))
                waitUntil(action: { (done) in
                    _ = subject.teamIndex().subscribeError({ (_error) in
                        expect(_error as NSError) == error
                        done()
                    })
                })
            }
        }
        
    }
}