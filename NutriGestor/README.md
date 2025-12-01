# 📱 NutriGestor
Sistema móvil para gestión nutricional y seguimiento clínico

## 🧩 Descripción General
NutriGestor es una aplicación móvil desarrollada en **SwiftUI** y **SwiftData**, diseñada para que nutriólogos y profesionales del bienestar puedan **registrar, administrar y dar seguimiento** al progreso físico de sus pacientes de manera moderna, rápida y visual.

La app ofrece:
- Interfaz limpia y profesional
- Registro ágil de pacientes y sesiones
- Visualización clara del progreso
- Persistencia local automática
- Navegación simple basada en Tab Bar

---

## 🎯 Objetivo del Proyecto
Brindar una herramienta que permita:
- Gestionar el historial clínico nutricional de pacientes
- Registrar medidas por sesión (peso y notas)
- Visualizar cambios a lo largo del tiempo
- Facilitar la consulta rápida de información

---

## ✅ Alcance Funcional
Incluye:
- Registro de pacientes
- Edición y eliminación de pacientes
- Registro de sesiones por paciente
- Eliminación de sesiones
- Búsqueda inteligente por paciente
- Vista de detalle por paciente
- Vista general de sesiones
- Modal con gráfica de progreso
- Persistencia con SwiftData

No incluye (por ahora):
- Sincronización en la nube
- Perfiles de usuario
- Planes nutricionales
- Exportación PDF
- Multi-dispositivo

---

## 🏛️ Arquitectura del Proyecto
**Patrón:** Feature-Based + MVVM + SwiftData

```bash
NutriGestor/
├── App/
├── Domain/
│   ├── Models/
│   └── Services/
├── Data/
│   ├── SwiftData/
│   └── Repositories/
├── Utils/
│   ├── Formatters/
│   ├── Validators/
│   └── Extensions/
├── Features/
│   ├── Shared/
│   ├── Patients/
│   │   ├── List/
│   │   ├── Create/
│   │   ├── Edit/
│   │   └── Detail/
│   ├── Sessions/
│   │   ├── List/
│   │   └── Detail/
│   └── Settings/
└── Resources/
```

### ✅ Tecnologías Principales
- **SwiftUI** – UI declarativa
- **SwiftData** – Persistencia local
- **MVVM** – Separación de lógica/UI
- **Charts** – Visualización de métricas

---

## 🧱 Módulos Principales
### 🔵 Pacientes
- Lista con tarjetas
- Búsqueda en tiempo real
- Crear / Editar / Eliminar
- Vista de detalle con sesiones

### 🟣 Sesiones
- Lista global de sesiones
- Búsqueda por paciente
- Botón "Ver progreso"
- Modal con gráfica de evolución

### ⚙️ Ajustes
- Vista base para futuras configuraciones

---

## 🧠 Modelos (SwiftData)
- **Paciente**
  - nombre, apellido, estatura, email, teléfono, notas
  - relación 1 - N con Sesion

- **Sesion**
  - fecha, peso, notas, paciente asociado

---

## 📊 Funciones Clave
✔ Persistencia automática con SwiftData
✔ Validadores de inputs
✔ Formateo de fechas y métricas
✔ Cálculo del último peso y progreso
✔ Gráfica con tendencia de peso
✔ UI modular y reutilizable

---

## 🎨 Diseño y Estética
- Colores suaves estilo salud
- Verde como color principal de progreso
- Cards redondeadas tipo Apple Health
- Navegación limpia con Tab Bar

---

## 🚀 Futuras Mejoras (Roadmap)
- Sincronización en iCloud
- IMC e indicadores adicionales
- Exportación PDF del progreso
- Recordatorios de citas
- Comparativas gráficas avanzadas
- Planeación nutricional

---

## 👨‍💻 Desarrollo
- Basado en mejores prácticas de SwiftUI + MVVM
- Código modular y escalable
- Arquitectura limpia por Features
- Documentación de componentes clave

---

## ✅ Estado Actual del Proyecto
✅ Arquitectura completa
✅ Modelos y persistencia funcional
✅ CRUD de pacientes y sesiones
✅ Búsquedas activas
✅ Modal de progreso con gráfica
✅ App lista para pruebas y mejoras

---

## 📌 Autor
Desarrollado por **Jesús Almanza Contreras (Yisus el chido)** 

---

## 🏁 Conclusión
NutriGestor es una base sólida y escalable para una plataforma nutricional profesional, preparada para crecer hacia métricas avanzadas, sincronización y servicios inteligentes.

Listo para presentación, demo o pitch con inversionistas o profesores 🚀


