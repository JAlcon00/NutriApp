//
//  PacienteAvatar.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct PacienteAvatar: View {
    let nombre: String
    let apellido: String

    private var iniciales: String {
        let n = nombre.first.map(String.init) ?? ""
        let a = apellido.first.map(String.init) ?? ""
        return n + a
    }

    var body: some View {
        Text(iniciales)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 48, height: 48)
            .background(AppColors.primaryGreen)
            .clipShape(Circle())
    }
}

