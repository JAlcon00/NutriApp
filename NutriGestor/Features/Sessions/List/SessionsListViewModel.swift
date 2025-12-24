// SessionsListViewModel.swift
import Foundation
import Observation

@Observable
final class SessionsListViewModel {

    var searchText: String = ""
    var pacienteSeleccionado: Paciente? = nil

    init() {}

    func filtrarSesiones(_ sesiones: [Sesion]) -> [Sesion] {

        guard !searchText.isEmpty else {
            pacienteSeleccionado = nil
            return sesiones
        }

        let q = searchText.lowercased()

        let filtradas = sesiones.filter { sesion in
            let p = sesion.paciente
            return p.nombre.lowercased().contains(q)
                || p.apellido.lowercased().contains(q)
        }

        pacienteSeleccionado = filtradas.first?.paciente
        return filtradas
    }

    func sesionesParaGrafica(_ sesiones: [Sesion]) -> [Sesion] {
        sesiones.sorted { $0.fecha < $1.fecha }
    }
}
