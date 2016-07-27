import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import DoneThisKit

class TeamSpec: QuickSpec {
    override func spec() {
        var json: JSON!
        var team: Team!
        
        beforeEach {
            json = readJson("team")
            team = try! Team(json: json)
        }
        
        it("should have the correct name") {
            expect(team.name) == "Example Team 1"
        }
        
        it("should have the correct hashId") {
            expect(team.hashId) == "abcdef123456"
        }
        
        it("should have the correct createdAt") {
            expect(team.createdAt) == DateFormatters.main.dateFromString("2016-07-05T07:13:57.873Z")!
        }
        
        it("should have the correct updatedAt") {
            expect(team.updatedAt) == DateFormatters.main.dateFromString("2016-07-05T07:13:57.873Z")!
        }
    }
}
