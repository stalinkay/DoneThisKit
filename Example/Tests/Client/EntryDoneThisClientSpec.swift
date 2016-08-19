import Foundation
import Quick
import Nimble
import Mockingjay

@testable import DoneThisKit

class EntryDoneThisClientSpec: QuickSpec {
    override func spec() {
        
        var subject: DoneThisClient!
        
        beforeEach {
            subject = DoneThisClient()
        }
        
        // MARK: - -entryIndex:teamId
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.entryIndex(teamId: "333").URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.entryIndex(teamId: "333")
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = [readJson("entry").object]
            return ["url": url, "executor": executor, "response": response]
        }
      
        // MARK: - -entryShow:hashId:
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.entryShow(hashId: "123512351").URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.entryShow(hashId: "123512351")
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = readJson("entry").object
            return ["url": url, "executor": executor, "response": response]
        }
        
        // MARK: - -entryCreate:body:teamId:status:
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.entryCreate(body: "body", teamId: "teamId", status: .Done).URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.entryCreate(body: "body", teamId: "teamId", status: .Done)
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = readJson("entry").object
            return ["url": url, "executor": executor, "response": response]
        }
        
        
        // MARK: - -entryUpdate:hashId:body:teamId:status
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.entryUpdate(hashId: "hashId", body: "body", teamId: "teamId", status: .Done).URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.entryUpdate(hashId: "hashId", body: "body", teamId: "teamId", status: .Done)
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = readJson("entry").object
            return ["url": url, "executor": executor, "response": response]
        }
        
        // MARK: - -entryDelete:hashId:
        
        itBehavesLike("done-this-client") { () -> (NSDictionary) in
            let url = subject.requestFactory.entryDelete(hashId: "hashId").URL!.absoluteString
            let executor = RequestExecutor { response in
                _ = subject.entryDelete(hashId: "hashId")
                    .doOnNext { _ in response(nil) }
                    .doOnError(response)
                    .subscribe()
            }
            let response = [:]
            return ["url": url, "executor": executor, "response": response]
        }
        
    }
}