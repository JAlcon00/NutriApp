//
//  SettingsView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct SettingsView: View {

    @Bindable var viewModel: SettingsViewModel

    var body: some View {
        NavigationStack {
            List {
                Section("Apariencia") {
                    Toggle("Tema oscuro", isOn: $viewModel.darkModeEnabled)
                }

                Section("Información") {
                    Button("Acerca de NutriGestor") {}
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}
