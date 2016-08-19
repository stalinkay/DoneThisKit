import Foundation
import Quick
import Nimble
import SwiftyJSON
import Mockingjay

@testable import DoneThisKit

class RequestExecutor {
    let execute: ((ErrorType?) -> ()) -> ()
    
    init(execute: ((ErrorType?) -> ()) -> ()) {
        self.execute = execute
    }
}

class DoneThisClientSharedExample: QuickConfiguration {
    override class func configure(configuration: Configuration) {
        sharedExamples("done-this-client") { (sharedExampleContext: SharedExampleContext) in
            
            var url: String!
            var executor: RequestExecutor!
            var response: AnyObject!
            
            beforeEach {
                let context = sharedExampleContext()
                url = context["url"] as! String
                executor = context["executor"] as! RequestExecutor
                response = context["response"]
            }
            
            afterEach {
                MockingjayProtocol.removeAllStubs()
            }
            
            it("should map the response if the API response is successful") {
                MockingjayProtocol.addStub(uri(url), builder: json(response))
                waitUntil(action: { (done) in
                    executor.execute { error in
                        expect(error).to(beNil())
                        done()
                    }
                })
            }
            
            it("should map the response if the API response is an error") {
                let error = NSError(domain: "test", code: -1, userInfo: nil)
                MockingjayProtocol.addStub(uri(url), builder: failure(error))
                waitUntil(action: { (done) in
                    executor.execute { _error in
                        expect(_error as? NSError) == error
                        done()
                    }
                })
            }
            
            
        }
        
    }
}