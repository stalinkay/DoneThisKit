import Foundation
import Quick
import Nimble
import Mockingjay

@testable import DoneThisKit

class HookDoneThisClientSpec: QuickSpec {
    override func spec() {
        
        var subject: DoneThisClient!
        
        beforeEach {
            subject = DoneThisClient()
        }
        
        // MARK: - -hookIndex
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.hookIndex().URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.hookIndex()
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = [readJson("hook").object]
            return ["url": url, "executor": executor, "response": response]
        }
        
        // MARK: - -hookShow:identifier:
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.hookShow(identifier: "id").URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.hookShow(identifier: "id")
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = readJson("hook").object
            return ["url": url, "executor": executor, "response": response]
        }
        
        // MARK: - -hookUpdate:identifier:targetUrl:teamId:
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.hookUpdate(identifier: "id", targetUrl: "url", teamId: "team_id").URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.hookUpdate(identifier: "id", targetUrl: "url", teamId: "team_id")
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = readJson("hook").object
            return ["url": url, "executor": executor, "response": response]
        }
        
        // MARK: - -hookDelete:identifier:
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.hookDelete(identifier: "id").URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.hookDelete(identifier: "id")
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = [:]
            return ["url": url, "executor": executor, "response": response]
        }
    }
}