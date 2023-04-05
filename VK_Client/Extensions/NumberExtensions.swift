
import Foundation

extension Int {
    func toDate() -> Date {
        let date = Date(timeIntervalSince1970: Double(self))
        return date
    }
}
