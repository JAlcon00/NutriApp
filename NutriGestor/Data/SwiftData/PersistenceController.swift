//
//  PersistenceController.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

// PersistenceController.swift
import SwiftData
import Foundation

@MainActor
final class PersistenceController {

    static let shared = PersistenceController()

    let container: ModelContainer

    private init() {
        container = ModelContainerProvider.shared
    }

    func context() -> ModelContext {
        ModelContext(container)
    }
}
