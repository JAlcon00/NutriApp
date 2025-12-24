//
//  Paciente.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//
import SwiftData
import Foundation

// MARK: - Tipos de dominio

enum TipoCuerpo: String, Codable, CaseIterable {
    case ectomorfo
    case mesomorfo
    case endomorfo
    case mixto

    var displayName: String {
        switch self {
        case .ectomorfo: return "Ectomorfo"
        case .mesomorfo: return "Mesomorfo"
        case .endomorfo: return "Endomorfo"
        case .mixto: return "Mixto"
        }
    }
}

enum ActividadFisica: String, Codable, CaseIterable {
    case sedentario
    case ligero
    case moderado
    case intenso
    case atleta

    var displayName: String {
        switch self {
        case .sedentario: return "Sedentario"
        case .ligero: return "Ligero"
        case .moderado: return "Moderado"
        case .intenso: return "Intenso"
        case .atleta: return "Atleta"
        }
    }
}

@Model
final class Paciente {

    @Attribute(.unique) var id: UUID
    var nombre: String
    var apellido: String
    var email: String?
    var telefono: String?
    var estaturaCm: Double
    // Métricas adicionales
    var edad: Int?
    var tipoCuerpoRaw: String?
    var actividadFisicaRaw: String?
    var notas: String?
    @Relationship(deleteRule: .cascade, inverse: \Sesion.paciente) var sesiones: [Sesion]

    // Computed properties para trabajar con enums
    var tipoCuerpo: TipoCuerpo? {
        get { tipoCuerpoRaw.flatMap(TipoCuerpo.init(rawValue:)) }
        set { tipoCuerpoRaw = newValue?.rawValue }
    }

    var actividadFisica: ActividadFisica? {
        get { actividadFisicaRaw.flatMap(ActividadFisica.init(rawValue:)) }
        set { actividadFisicaRaw = newValue?.rawValue }
    }

    init(
        nombre: String,
        apellido: String,
        email: String? = nil,
        telefono: String? = nil,
        estaturaCm: Double,
        notas: String? = nil
    ) {
        self.id = UUID()
        self.nombre = nombre
        self.apellido = apellido
        self.email = email
        self.telefono = telefono
        self.estaturaCm = estaturaCm
        self.notas = notas
        self.edad = nil
        self.tipoCuerpoRaw = nil
        self.actividadFisicaRaw = nil
        self.sesiones = []
    }
}

