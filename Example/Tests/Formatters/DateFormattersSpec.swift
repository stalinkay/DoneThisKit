import Foundation
import Quick
import Nimble

@testable import DoneThisKit

class DateFormattersSpec: QuickSpec {
    override func spec() {
        
        describe("-main") {
            it("should return the correct format") {
                let formatter = DateFormatters.main
                expect(formatter.dateFormat) == "yyyy-MM-dd'T'HH:mm:ss.zzzZ"
            }
        }
        
    }
}