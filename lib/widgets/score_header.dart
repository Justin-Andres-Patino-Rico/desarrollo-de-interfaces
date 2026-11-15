import 'package:material_ui/material_ui.dart';
import '../themes/app_theme.dart';

/// Muestra las mismas puntuaciones que las zonas centrales de cada equipo
class ScoreHeader extends StatelessWidget {
  final int localScore;
  final int visitScore;

  const ScoreHeader({
    super.key,
    required this.localScore,
    required this.visitScore,
  });

  /// Punto de color junto al nombre del equipo
  Widget _dot(Color color) => Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Etiqueta del equipo local (izquierda)
          Row(children: [
            _dot(AppTheme.localLight),
            const SizedBox(width: 6),
            const Text('LOCAL',
                style: TextStyle(
                    color: AppTheme.localLight,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ]),
          // Píldora central con ambas puntuaciones
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.pill,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Text('$localScore',
                  style: const TextStyle(
                      color: AppTheme.localLight,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 14),
              const Text('VS',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 14),
              Text('$visitScore',
                  style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
          // Etiqueta del equipo visitante (derecha)
          Row(children: [
            const Text('VISITA',
                style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            const SizedBox(width: 6),
            _dot(const Color(0xFFEF4444)),
          ]),
        ],
      ),
    );
  }
}