import 'package:material_ui/material_ui.dart';
import '../themes/app_theme.dart';
import '../widgets/reset_button.dart';
import '../widgets/score_header.dart';
import '../widgets/team_panel.dart';

/// Pantalla principal: une los widgets y contiene la lógica del marcador
class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen({super.key});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  // Estado: puntuación de cada equipo. Un único valor alimenta tanto
  // el marcador superior como la zona central, así siempre están sincronizados
  int _localScore = 0;
  int _visitScore = 0;

  /// Suma un punto al equipo local
  void _incrementLocal() => setState(() => _localScore++);

  /// Resta un punto al local sin bajar nunca de cero
  void _decrementLocal() => setState(() {
        if (_localScore > 0) _localScore--;
      });

  /// Suma un punto al equipo visitante
  void _incrementVisit() => setState(() => _visitScore++);

  /// Resta un punto al visitante sin bajar nunca de cero
  void _decrementVisit() => setState(() {
        if (_visitScore > 0) _visitScore--;
      });

  /// Reinicia ambas puntuaciones a cero
  void _reset() => setState(() {
        _localScore = 0;
        _visitScore = 0;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Cabecera con icono y título de la app
              const Row(children: [
                Icon(Icons.sports_basketball, color: Colors.white, size: 24),
                SizedBox(width: 12),
                Text('MARCADOR',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 32),
              // Marcador superior con ambas puntuaciones
              ScoreHeader(localScore: _localScore, visitScore: _visitScore),
              const SizedBox(height: 12),
              // Paneles de los dos equipos, uno junto al otro
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: TeamPanel(
                      name: 'EQUIPO LOCAL',
                      score: _localScore,
                      lightColor: AppTheme.localLight,
                      darkColor: AppTheme.localDark,
                      onIncrement: _incrementLocal,
                      onDecrement: _decrementLocal,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TeamPanel(
                      name: 'EQUIPO VISITA',
                      score: _visitScore,
                      lightColor: AppTheme.visitLight,
                      darkColor: AppTheme.visitDark,
                      onIncrement: _incrementVisit,
                      onDecrement: _decrementVisit,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              // Botón RESET centrado
              Center(child: ResetButton(onPressed: _reset)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}