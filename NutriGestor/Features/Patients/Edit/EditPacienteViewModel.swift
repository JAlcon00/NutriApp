//
//  EditPacienteViewModel.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import Foundation
import SwiftData
import Observation

@Observable
final class EditPacienteViewModel {

    var paciente: Paciente

    var nombre: String
    var apellido: String
    var email: String
    var telefono: String
    var estaturaCm: String
    var notas: String

    private let validator = PacienteValidator.self
    private let service = PacienteService()

    init(paciente: Paciente) {
        self.paciente = paciente
        self.nombre = paciente.nombre
        self.apellido = paciente.apellido
        self.email = paciente.email ?? ""
        self.telefono = paciente.telefono ?? ""
        self.estaturaCm = String(paciente.estaturaCm)
        self.notas = paciente.notas ?? ""
    }

    var esValido: Bool {
        guard let estatura = Double(estaturaCm) else { return false }
        return validator.validarNombre(nombre)
            && validator.validarApellido(apellido)
            && validator.validarEstatura(estatura)
            && validator.validarEmail(email)
            && validator.validarTelefono(telefono)
    }

    func actualizarPaciente(context: ModelContext) {
        guard let estatura = Double(estaturaCm) else { return }

        paciente.nombre = service.normalizarNombre(nombre)
        paciente.apellido = service.normalizarApellido(apellido)
        paciente.email = email.isEmpty ? nil : email
        paciente.telefono = telefono.isEmpty ? nil : telefono
        paciente.estaturaCm = estatura
        paciente.notas = notas.isEmpty ? nil : notas

        try? context.save()
    }
}
