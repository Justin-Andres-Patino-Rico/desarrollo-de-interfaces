import 'package:material_ui/material_ui.dart';
import '../themes/app_theme.dart';

/// Botón inferior RESET con icono de recarga
class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh, color: Colors.white),
      label: const Text('RESET',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      style: OutlinedButton.styleFrom(
        backgroundColor: AppTheme.surface,
        side: const BorderSide(color: AppTheme.border),
        minimumSize: const Size(178, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}