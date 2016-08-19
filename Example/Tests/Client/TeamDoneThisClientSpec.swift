import Foundation
import Quick
import Nimble
import Mockingjay

@testable import DoneThisKit

class TeamDoneThisClientSpec: QuickSpec {
    override func spec() {
        
        var subject: DoneThisClient!
        
        beforeEach {
            subject = DoneThisClient()
        }
        
        // MARK: - -teamIndex
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.teamIndex().URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.teamIndex()
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = [readJson("team").object]
            return ["url": url, "executor": executor, "response": response]
        }
        
        
        // MARK: - -teamShow
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.teamShow(hashId: "id").URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.teamShow(hashId: "id")
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = readJson("team").object
            return ["url": url, "executor": executor, "response": response]
        }
    }
}