import Foundation

extension Date {
    func toPacienteFormat() -> String {
        DateFormatter.pacienteDate.string(from: self)
    }
}
