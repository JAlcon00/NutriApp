//
//  PacienteValidator.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation

struct PacienteValidator {

    static func validarNombre(_ nombre: String) -> Bool {
        !nombre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    static func validarApellido(_ apellido: String) -> Bool {
        !apellido.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    static func validarEstatura(_ estatura: Double) -> Bool {
        estatura > 0
    }

    static func validarEmail(_ email: String?) -> Bool {
        guard let email = email, !email.isEmpty else { return true }
        return email.contains("@") && email.contains(".")
    }

    static func validarTelefono(_ telefono: String?) -> Bool {
        guard let telefono = telefono, !telefono.isEmpty else { return true }
        return telefono.count >= 8
    }
}
