//
//  SplashView.swift
//  NutriGestor
//
//  Created by José de Jesús Almanza Contreras on 25/11/25.
//

import SwiftUI

struct SplashView: View {

    @State private var scale: CGFloat = 0.6
    @State private var showMain = false

    var body: some View {
        ZStack {
            AppColors.softBackground.ignoresSafeArea()

            Image("NutriLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.2)) {
                        scale = 1.0
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        showMain = true
                    }
                }
        }
        .fullScreenCover(isPresented: $showMain) {
            TabBarView()
        }
    }
}
