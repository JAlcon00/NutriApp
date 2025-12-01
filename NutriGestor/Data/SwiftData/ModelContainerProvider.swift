//
//  ModelContainerProvider.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftData
import Foundation

enum ModelContainerProvider {

    static var shared: ModelContainer = {
        let schema = Schema([
            Paciente.self,
            Sesion.self
        ])

        let config = ModelConfiguration(isStoredInMemoryOnly: false)

        return try! ModelContainer(for: schema, configurations: config)
    }()
}
