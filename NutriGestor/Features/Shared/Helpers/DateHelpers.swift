//
//  DateHelpers.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

struct DateHelpers {
    static func ordenarDesc(_ fechas: [Date]) -> [Date] {
        fechas.sorted { $0 > $1 }
    }

    static func diasEntre(_ inicio: Date, _ fin: Date) -> Int {
        Calendar.current.dateComponents([.day], from: inicio, to: fin).day ?? 0
    }
}
