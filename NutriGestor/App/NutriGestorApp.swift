//
//  NutriGestorApp.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//


import SwiftUI
import SwiftData

@main
struct NutriGestorApp: App {

    var container: ModelContainer = {
        ModelContainerProvider.shared
    }()

    var body: some Scene {
        WindowGroup {
            SplashView()
                .modelContainer(container)
        }
    }

}
