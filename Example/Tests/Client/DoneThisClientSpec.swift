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

        }
        
    }
}