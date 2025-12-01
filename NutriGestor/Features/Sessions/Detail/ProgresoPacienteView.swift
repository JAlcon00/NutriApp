// ProgresoPacienteView.swift
// NutriGestor

import SwiftUI
import Charts

struct ProgresoPacienteView: View {

    let paciente: Paciente
    let sesiones: [Sesion]

    @State private var selectedMetric: MetricType = .peso

    enum MetricType: String, CaseIterable {
        case peso = "Peso"
        case imc = "IMC"
    }

    private var sesionesOrdenadas: [Sesion] {
        sesiones.sorted { $0.fecha < $1.fecha }
    }

    private var imcData: [(fecha: Date, imc: Double)] {
        let estaturaM = paciente.estaturaCm / 100
        let altura2 = estaturaM * estaturaM

        return sesionesOrdenadas.map { sesion in
            let imc = altura2 > 0 ? sesion.peso / altura2 : 0
            return (sesion.fecha, imc)
        }
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {

                Text("Progreso de \(paciente.nombre) \(paciente.apellido)")
                    .font(AppTypography.header)
                    .padding(.horizontal)

                Picker("Métrica", selection: $selectedMetric) {
                    ForEach(MetricType.allCases, id: \.self) { metric in
                        Text(metric.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                Chart {
                    switch selectedMetric {
                    case .peso:
                        ForEach(sesionesOrdenadas) { sesion in
                            LineMark(
                                x: .value("Fecha", sesion.fecha),
                                y: .value("Peso (kg)", sesion.peso)
                            )
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(AppColors.primaryGreen)

                            PointMark(
                                x: .value("Fecha", sesion.fecha),
                                y: .value("Peso (kg)", sesion.peso)
                            )
                            .foregroundStyle(AppColors.primaryGreen)
                        }

                    case .imc:
                        ForEach(imcData, id: \.fecha) { data in
                            LineMark(
                                x: .value("Fecha", data.fecha),
                                y: .value("IMC", data.imc)
                            )
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(.blue)

                            PointMark(
                                x: .value("Fecha", data.fecha),
                                y: .value("IMC", data.imc)
                            )
                            .foregroundStyle(.blue)
                        }
                    }
                }
                .frame(height: 260)
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Progreso")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }

    @Environment(\.dismiss) private var dismiss
}
