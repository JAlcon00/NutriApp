//
//  AddPacienteViewModel.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

// AddPacienteViewModel.swift
import Foundation
import SwiftData
import Observation

@Observable
final class AddPacienteViewModel {

    var nombre: String = ""
    var apellido: String = ""
    var email: String = ""
    var telefono: String = ""
    var estaturaCm: String = ""
    var edad: String = ""
    var tipoCuerpo: TipoCuerpo? = nil
    var actividadFisica: ActividadFisica? = nil
    var notas: String = ""

    private let validator = PacienteValidator.self
    private let service = PacienteService()

    var esValido: Bool {
        guard let estatura = Double(estaturaCm) else { return false }
        let _ = Int(edad) // edad es opcional; no invalida si no es número
        return validator.validarNombre(nombre)
            && validator.validarApellido(apellido)
            && validator.validarEstatura(estatura)
            && validator.validarEmail(email)
            && validator.validarTelefono(telefono)
    }

    func crearPaciente(context: ModelContext) {
        guard let estatura = Double(estaturaCm) else { return }

        let nuevo = Paciente(
            nombre: service.normalizarNombre(nombre),
            apellido: service.normalizarApellido(apellido),
            email: email.isEmpty ? nil : email,
            telefono: telefono.isEmpty ? nil : telefono,
            estaturaCm: estatura,
            notas: notas.isEmpty ? nil : notas
        )

        if let edadInt = Int(edad) { nuevo.edad = edadInt }
        nuevo.tipoCuerpo = tipoCuerpo
        nuevo.actividadFisica = actividadFisica

        context.insert(nuevo)
        try? context.save()
    }
}
