//
//  Double+.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

extension Date {
    func toPacienteFormat() -> String {
        DateFormatter.pacienteDate.string(from: self)
    }
}
