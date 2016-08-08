import Foundation
import Quick
import Nimble

@testable import DoneThisKit

class TeamRequestFactorySpec: QuickSpec {
    override func spec() {
        
        var subject: RequestFactory!
        
        beforeEach {
            subject = RequestFactory()
        }
        
        describe("-teamIndex") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.teamIndex()
                context["url"] = "https://beta.idonethis.com/api/v2/teams"
                context["method"] = "GET"
                return context
            })
        }
        
        describe("-teamShow:hashId:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.teamShow(hashId: "333")
                context["url"] = "https://beta.idonethis.com/api/v2/teams/333"
                context["method"] = "GET"
                return context
            })
        }
        
    }
}