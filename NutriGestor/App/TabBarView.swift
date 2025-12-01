//
//  TabBarView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

// TabBarView.swift
import SwiftUI

struct TabBarView: View {

    @State private var settings = SettingsViewModel()

    init() {
        UITabBar.appearance().tintColor = UIColor(AppColors.primaryGreen)
    }

    var body: some View {
        TabView {
            PatientsListView()
                .tabItem {
                    Label("Pacientes", systemImage: "person.3.fill")
                }

            SessionsListView()
                .tabItem {
                    Label("Sesiones", systemImage: "chart.line.uptrend.xyaxis")
                }

            SettingsView(viewModel: settings)
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape.fill")
                }
        }
        .environment(\.colorScheme, settings.darkModeEnabled ? .dark : .light)
    }
}

