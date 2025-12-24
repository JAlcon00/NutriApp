// ProgresoPacienteView.swift
// NutriGestor

import SwiftUI
import Charts

struct ProgresoPacienteView: View {

    let paciente: Paciente
    let sesiones: [Sesion]

    @State private var selectedMetric: MetricType = .peso
    @State private var selectedRange: TimeRange = .todo
    private let metrics = MetricsService()

    enum MetricType: String, CaseIterable {
        case peso = "Peso"
        case imc = "IMC"
    }

    enum TimeRange: String, CaseIterable {
        case todo = "Todo"
        case m3 = "3M"
        case m6 = "6M"
        case m12 = "12M"

        var months: Int? {
            switch self {
            case .todo: return nil
            case .m3: return 3
            case .m6: return 6
            case .m12: return 12
            }
        }
    }

    private var sesionesOrdenadas: [Sesion] {
        sesiones.sorted { $0.fecha < $1.fecha }
    }

    private var sesionesFiltradas: [Sesion] {
        guard let months = selectedRange.months else { return sesionesOrdenadas }
        let calendar = Calendar.current
        guard let fromDate = calendar.date(byAdding: .month, value: -months, to: Date()) else {
            return sesionesOrdenadas
        }
        return sesionesOrdenadas.filter { $0.fecha >= fromDate }
    }

    private var imcData: [(fecha: Date, imc: Double)] {
        let estatura = paciente.estaturaCm
        return sesionesFiltradas.map { sesion in
            let value = sesion.imc ?? metrics.calcularIMC(peso: sesion.peso, estaturaCm: estatura)
            return (sesion.fecha, value)
        }
    }

    private var pesoActual: Double? { metrics.obtenerPesoActual(sesiones: sesionesFiltradas) }
    private var diferenciaPeso: Double? { metrics.diferenciaDePeso(sesiones: sesionesFiltradas) }
    private var ultimoIMC: Double? { imcData.last?.imc }

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

                Picker("Rango", selection: $selectedRange) {
                    ForEach(TimeRange.allCases, id: \.self) { range in
                        Text(range.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                switch selectedMetric {
                case .peso:
                    if let actual = pesoActual {
                        HStack(spacing: 8) {
                            Text("Peso actual: \(actual.formatPeso()) kg")
                                .font(AppTypography.body.weight(.semibold))
                                .foregroundColor(AppColors.primaryGreen)
                            if let diff = diferenciaPeso {
                                let sign = diff >= 0 ? "+" : ""
                                Text("(\(sign)\(diff.formatPeso()) kg)")
                                    .font(AppTypography.caption)
                                    .foregroundColor(AppColors.textSecondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                case .imc:
                    if let imc = ultimoIMC {
                        Text("IMC actual: \(String(format: \"%.1f\", imc))")
                            .font(AppTypography.body.weight(.semibold))
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    }
                }

                if sesionesFiltradas.isEmpty {
                    EmptyStateView(
                        message: "No hay datos en el rango seleccionado.",
                        systemImage: "chart.line.uptrend.xyaxis"
                    )
                    .padding(.horizontal)
                } else {
                    Chart {
                        switch selectedMetric {
                        case .peso:
                            ForEach(sesionesFiltradas) { sesion in
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
                            if let last = sesionesFiltradas.last {
                                PointMark(
                                    x: .value("Fecha", last.fecha),
                                    y: .value("Peso (kg)", last.peso)
                                )
                                .symbol(.circle)
                                .foregroundStyle(AppColors.primaryGreen)
                                .annotation(position: .top) {
                                    Text("\(last.peso.formatPeso()) kg")
                                        .font(.caption)
                                        .foregroundColor(AppColors.textSecondary)
                                }
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
                            if let last = imcData.last {
                                PointMark(
                                    x: .value("Fecha", last.fecha),
                                    y: .value("IMC", last.imc)
                                )
                                .symbol(.circle)
                                .foregroundStyle(.blue)
                                .annotation(position: .top) {
                                    Text(String(format: "%.1f", last.imc))
                                        .font(.caption)
                                        .foregroundColor(AppColors.textSecondary)
                                }
                            }
                        }
                    }
                    .chartXAxis {
                        AxisMarks(values: .automatic(desiredCount: 5)) { value in
                            AxisGridLine()
                            AxisValueLabel {
                                if let date = value.as(Date.self) {
                                    Text(date, format: .dateTime.day().month(.abbreviated))
                                }
                            }
                        }
                    }
                    .chartYAxis {
                        AxisMarks { value in
                            AxisGridLine()
                            AxisValueLabel {
                                if let v = value.as(Double.self) {
                                    if selectedMetric == .peso {
                                        Text("\(v, format: .number.precision(.fractionLength(1))) kg")
                                    } else {
                                        Text("\(v, format: .number.precision(.fractionLength(1)))")
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 260)
                    .padding(.horizontal)
                }

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
