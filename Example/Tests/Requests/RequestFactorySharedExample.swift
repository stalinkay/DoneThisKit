import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import DoneThisKit

class RequestFactorySharedExample: QuickConfiguration {
    override class func configure(configuration: Configuration) {
        sharedExamples("factory-request") { (sharedExampleContext: SharedExampleContext) in
            
            var url: String!
            var request: NSURLRequest!
            var method: String!
            var body: [String: AnyObject]!
            
            beforeEach {
                let context = sharedExampleContext()
                request = context["request"] as! NSURLRequest
                url = context["url"] as! String
                method = context["method"] as! String
                body = context["body"] as? [String: AnyObject]
            }
            
            it("should have the correct url") {
                expect(request.URL?.absoluteString) == url
            }
            
            it("should have the correct method") {
                expect(request.HTTPMethod) == method
            }
            
            it("should have the correct body") {
                let requestJson = request.HTTPBody != nil ? JSON(data: request.HTTPBody!) : JSON([:])
                let expectedJson = body != nil ? JSON(body) : JSON([:])
                expect(requestJson) == expectedJson
            }
        }
    }
}