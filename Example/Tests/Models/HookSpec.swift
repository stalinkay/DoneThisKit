import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import DoneThisKit

class HookSpec: QuickSpec {
    override func spec() {
        
        var json: JSON!
        var hook: Hook!
        
        beforeEach {
            json = readJson("hook")
            hook = try! Hook(json: json)
        }
        
        it("should have the correct id") {
            expect(hook.id) == 1
        }
        
        it("should have the correct targetUrl") {
            expect(hook.targetUrl) == "https://example.com/hook/endpoint"
        }
        
        it("should have the correct createdAt") {
            expect(hook.createdAt) == DateFormatters.main.dateFromString("2016-07-05T13:27:57.681Z")
        }
        
        it("should have the correct updatedAt") {
            expect(hook.updatedAt) == DateFormatters.main.dateFromString("2016-07-05T13:27:57.681Z")
        }
        
        it("should have the correct team name") {
            expect(hook.team.name) == "Example Team 1"
        }
        
        it("should have the correct team hashId") {
            expect(hook.team.hashId) == "abcdef123456"
        }
        
        it("should have the correct user emailAddres") {
            expect(hook.user.emailAddress) == "example@user.com"
        }
        
        it("shoudl have the correct user fullName") {
            expect(hook.user.fullName) == "Example User 1"
        }
        
        it("should have the correct user hashId") {
            expect(hook.user.hashId) == "32630c61"
        }
        
    }
}