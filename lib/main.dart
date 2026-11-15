import 'package:material_ui/material_ui.dart';
import 'screens/scoreboard_screen.dart';
import 'themes/app_theme.dart';

/// Punto de entrada de la aplicación
void main() {
  runApp(const MarcadorApp());
}

/// Widget raíz: configura MaterialApp, el tema global y la pantalla inicial
class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme, // Tema global definido en themes/
      home: const ScoreboardScreen(), // Pantalla inicial
    );
  }
}