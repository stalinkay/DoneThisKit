import Foundation
import Quick
import Nimble

@testable import DoneThisKit

class EntryRequestFactorySpec: QuickSpec {
    override func spec() {
        
        var subject: RequestFactory!
        
        beforeEach {
            subject = RequestFactory()
        }
        
        describe("-entryIndex") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.entryIndex(teamId: "333")
                context["url"] = "https://beta.idonethis.com/api/v2/teams/333/entries"
                context["method"] = "GET"
                return context
            })
        }
        
        describe("-entryShow:hashId:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.entryShow(hashId: "333")
                context["url"] = "https://beta.idonethis.com/api/v2/entries/333"
                context["method"] = "GET"
                return context
            })
        }
        
        describe("-entryCreate:body:teamId:occurredOn:status:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.entryCreate(body: "body", teamId: "333", status: EntryStatus.Goal)
                context["url"] = "https://beta.idonethis.com/api/v2/entries?body=body&status=goal&team_id=333"
                context["method"] = "POST"
                context["body"] = []
                return context
            })
        }
        
        describe("-entryUpdate:hashId:body:teamId:occurredOn:status:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.entryUpdate(hashId: "444", body: "body", teamId: "333", status: EntryStatus.Goal)
                context["url"] = "https://beta.idonethis.com/api/v2/entries/444"
                context["method"] = "POST"
                context["body"] = ["team_id": "333", "status": "goal", "body": "body"]
                return context
            })
        }
        
        describe("-entryDelete:") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.entryDelete(hashId: "333")
                context["url"] = "https://beta.idonethis.com/api/v2/entries/333"
                context["method"] = "DELETE"
                return context
            })
        }
        
    }
}