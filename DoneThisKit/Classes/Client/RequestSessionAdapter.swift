import Foundation
import Core

internal class RequestSessionAdapter: Adapter<NSURLRequest, NSURLRequest> {
    
    // MARK: - Init
    
    public static var instance: RequestSessionAdapter = RequestSessionAdapter()
    
    
    // MARK: - <Adapter>
    
    override func adapt(input: NSURLRequest) -> NSURLRequest! {
        //TODO
        return input
    }
    
}
