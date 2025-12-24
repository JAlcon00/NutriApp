import Foundation

extension Double {
    func formatPeso() -> String {
        NumberFormatter.pesoFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
