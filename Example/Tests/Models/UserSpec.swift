import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import DoneThisKit

class UserSpec: QuickSpec {
    override func spec() {
        
        var json: JSON!
        var user: User!
        
        beforeEach {
            json = readJson("user")
            user = try! User(json: json)
        }
        
        it("should have the correct emailAddress") {
            expect(user.emailAddress) == "example@user.com"
        }
        
        it("should have the correct fullName") {
            expect(user.fullName) == "Example User 1"
        }
        
        it("should have the correct hashId") {
            expect(user.hashId) == "32630c61"
        }
    }
}