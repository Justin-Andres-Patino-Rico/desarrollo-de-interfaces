import 'package:material_ui/material_ui.dart';

/// Paleta de colores y tema global de la aplicación
class AppTheme {
  // Fondo general de la pantalla
  static const Color background = Color(0xFF121316);
  // Fondo y borde del marcador superior y del botón RESET
  static const Color surface = Color(0xFF26272B);
  static const Color border = Color(0xFF8E9096);
  // Fondo de la "píldora" central del marcador superior
  static const Color pill = Color(0xFF131417);

  // Colores del equipo local (azul): botones, zona central y etiqueta
  static const Color localLight = Color(0xFF3B82F6);
  static const Color localDark = Color(0xFF2E62B3);
  // Colores del equipo visitante (rojo)
  static const Color visitLight = Color(0xFFDC2626);
  static const Color visitDark = Color(0xFF9B2222);

  // Tema oscuro con la tipografía y el fondo comunes
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        useMaterial3: true,
        fontFamily: 'Roboto',
      );
}