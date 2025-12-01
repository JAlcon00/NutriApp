//
//  SeedData.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

// SeedData.swift
import SwiftData
import Foundation

@MainActor
struct SeedData {

    static func cargarDatosDemo(context: ModelContext) {

        let existe = try? context.fetch(
            FetchDescriptor<Paciente>(predicate: #Predicate { !$0.nombre.isEmpty })
        )

        if let existe, !existe.isEmpty { return }

        let paciente1 = Paciente(
            nombre: "Carlos",
            apellido: "Ramírez",
            email: "carlos@example.com",
            telefono: "4771234567",
            estaturaCm: 175,
            notas: "Paciente ejemplo."
        )

        let paciente2 = Paciente(
            nombre: "Ana",
            apellido: "Gómez",
            email: "ana@example.com",
            telefono: "5558765432",
            estaturaCm: 162,
            notas: "Paciente para pruebas."
        )

        let sesion1 = Sesion(
            fecha: .now,
            peso: 78.4,
            notas: "Inicio del tratamiento.",
            paciente: paciente1
        )

        let sesion2 = Sesion(
            fecha: .now.addingTimeInterval(-86400 * 7),
            peso: 80.1,
            notas: "Sesión inicial.",
            paciente: paciente1
        )

        context.insert(paciente1)
        context.insert(paciente2)
        context.insert(sesion1)
        context.insert(sesion2)

        try? context.save()
    }
}
