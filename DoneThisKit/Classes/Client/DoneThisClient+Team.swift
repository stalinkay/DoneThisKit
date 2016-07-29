import Foundation
import RxSwift

extension DoneThisClient {
    
    func index() -> Observable<[Team]> {
        return self.request(self.requestFactory.teamIndex()).map { try $0.0.arrayValue.map { try Team(json: $0) } }
    }
    
    func show(hashId hashId: String) -> Observable<Team> {
        return self.request(self.requestFactory.teamShow(hashId: hashId)).map { try Team(json: $0.0) }
    }
    
}
