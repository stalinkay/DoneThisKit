import Foundation

internal struct DateFormatters {

    internal static var main: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzzZ"
        return formatter
    }()

}
