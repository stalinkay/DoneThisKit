import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import DoneThisKit

class EntrySpec: QuickSpec {
    override func spec() {
        
        var json: JSON!
        var entry: Entry!
        
        beforeEach {
            json = readJson("entry")
            entry = try! Entry(json: json)
        }
        
        it("should have the correct body") {
            expect(entry.body) == "Rerum et voluptatem eius natus sequi. Error amet molestias est. Ipsam inventore esse unde. Ipsa dignissimos nihil consequatur quas sint natus dicta."
        }
        
        it("should have the correct createdAt") {
            expect(entry.createdAt) == DateFormatters.main.dateFromString("2016-07-05T07:13:59.350Z")
        }
        
        it("should have the correct updatedAt") {
            expect(entry.updatedAt) == DateFormatters.main.dateFromString("2016-07-05T07:13:59.350Z")
        }
        
        it("should have the correct ocurredOn") {
            expect(entry.occurredOn) == DateFormatters.main.dateFromString("2016-07-05T07:13:59.350Z")
        }
        
        it("should have the correct status") {
            expect(entry.status) == EntryStatus.Done
        }
        
        it("should have the correct hashId") {
            expect(entry.hashId) == "a38dea1b07ef987a1b2237fe9b3ff55f61db558a"
        }
        
        it("should have the correct completedOn") {
            expect(entry.completedOn).to(beNil())
        }
        
        it("should have the correct archivedAt") {
            expect(entry.archivedAt).to(beNil())
        }
        
        it("should have the correct team name") {
            expect(entry.team.name) == "Example Team 1"
        }
        
        it("should have the correct team hashId") {
            expect(entry.team.hashId) == "abcdef123456"
        }
        
        it("should have the correct user emailAddres") {
            expect(entry.user.emailAddress) == "example@user.com"
        }
        
        it("shoudl have the correct user fullName") {
            expect(entry.user.fullName) == "Example User 1"
        }
        
        it("should have the correct user hashId") {
            expect(entry.user.hashId) == "32630c61"
        }
    }
}