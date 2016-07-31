import Foundation
import Quick
import Nimble

@testable import DoneThisKit

class HookRequestFactorySpec: QuickSpec {
    override func spec() {
        
        var subject: RequestFactory!
        
        beforeEach {
            subject = RequestFactory()
        }
        
        describe("-hookIndex") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.hookIndex()
                context["url"] = "https://beta.idonethis.com/api/v2/hooks"
                context["method"] = "GET"
                return context
            })
        }
        
        describe("-hookShow:id:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.hookShow(id: "333")
                context["url"] = "https://beta.idonethis.com/api/v2/hooks/333"
                context["method"] = "GET"
                return context
            })
        }
        
        describe("-hookUpdate:id:targetUrl:teamId:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.hookUpdate(id: "333", targetUrl: "target_url", teamId: "444")
                context["url"] = "https://beta.idonethis.com/api/v2/hooks/333"
                context["method"] = "POST"
                context["body"] = ["target_url": "target_url", "team_id": "444"]
                return context
            })
        }
        
        describe("-hookDelete:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.hookDelete(id: "333")
                context["url"] = "https://beta.idonethis.com/api/v2/hooks/333"
                context["method"] = "DELETE"
                return context
            })
        }
        
    }
}