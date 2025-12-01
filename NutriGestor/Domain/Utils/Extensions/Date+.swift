//
//  Date+.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

extension Double {
    func formatPeso() -> String {
        NumberFormatter.pesoFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
