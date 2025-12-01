//
//  LoadingView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 24/11/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(AppColors.primaryGreen)
            .scaleEffect(1.4)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
