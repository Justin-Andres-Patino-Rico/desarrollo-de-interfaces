import 'package:material_ui/material_ui.dart';

/// Tarjeta vertical de un equipo. De arriba a abajo:
/// botón "+", puntuación central, botón "−" y nombre del equipo.
/// Es reutilizable: se usa con distintos colores para local y visitante
class TeamPanel extends StatelessWidget {
  final String name;
  final int score;
  final Color lightColor; // Color de los botones + y −
  final Color darkColor; // Color de la zona central y de la etiqueta
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const TeamPanel({
    super.key,
    required this.name,
    required this.score,
    required this.lightColor,
    required this.darkColor,
    required this.onIncrement,
    required this.onDecrement,
  });

  /// Botón de sumar/restar que ocupa toda su franja
  Widget _actionButton(IconData icon, VoidCallback onTap) {
    return Expanded(
      flex: 2,
      child: Material(
        color: lightColor,
        child: InkWell(
          onTap: onTap,
          child: Center(child: Icon(icon, color: Colors.white, size: 64)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Esquinas redondeadas
      child: Column(
        children: [
          // Botón para aumentar la puntuación
          _actionButton(Icons.add, onIncrement),
          // Zona central con la puntuación grande
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: darkColor,
              alignment: Alignment.center,
              child: Text(
                '$score',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 96,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Botón para disminuir la puntuación
          _actionButton(Icons.remove, onDecrement),
          // Etiqueta inferior con el nombre del equipo
          Container(
            width: double.infinity,
            height: 32,
            color: darkColor,
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}