import Foundation
import SwiftyJSON

@objc class FixtureReader: NSObject {}

internal func readJson(name: String) -> JSON {
    let bundle = NSBundle(forClass: FixtureReader.classForCoder())
    let path = bundle.pathForResource(name, ofType: "json")!
    let data = NSData(contentsOfFile: path)
    return JSON(data: data!)
}
