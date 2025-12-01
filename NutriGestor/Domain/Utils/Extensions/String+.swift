//
//  String+.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

extension String {
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var capitalizedFirst: String {
        prefix(1).uppercased() + dropFirst()
    }
}
