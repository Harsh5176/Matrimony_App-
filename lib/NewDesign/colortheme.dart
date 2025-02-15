import 'dart:ui';
//1st
// class AppColors {
//   static const Color primary = Color(0xFF165BAA);
//   static const Color secondary = Color(0xFFA155B9);
//   static const Color accent = Color(0xFFF765A3);
//   static const Color background = Color(0xFFF9D1D1);
//   static const Color surface = Color(0xFFFFA4B6);
//   static const Color textPrimary = Color(0xFF030831);
//   static const Color textSecondary = Color(0xFF165BAA);
//   static const Color error = Color(0xFFB00020);
//   static const Color success = Color(0xFF4CAF50);
// }


class AppColors {
  // 1. Modern & Minimalistic (Cool Tones)
  static const Map<String, Color> modernMinimal = {
    "primary": Color(0xFF0A84FF),
    "secondary": Color(0xFF5E5CE6),
    "accent": Color(0xFFFFD60A),
    "background": Color(0xFFF2F2F7),
    "surface": Color(0xFFE0E0E0),
    "textPrimary": Color(0xFF1C1C1E),
    "textSecondary": Color(0xFF5E5CE6),
    "error": Color(0xFFB00020),
    "success": Color(0xFF4CAF50),
  };

  // 2. Elegant & Professional (Dark Mode)
  static const Map<String, Color> darkMode = {
    "primary": Color(0xFF1E1E2C),
    "secondary": Color(0xFF3D3D5C),
    "accent": Color(0xFFFAD02E),
    "background": Color(0xFF121212),
    "surface": Color(0xFF1C1C1C),
    "textPrimary": Color(0xFFE5E5E5),
    "textSecondary": Color(0xFFB8B8B8),
    "error": Color(0xFFCF6679),
    "success": Color(0xFF00E676),
  };

  // 3. Soft Pastel Theme
  static const Map<String, Color> pastelTheme = {
    "primary": Color(0xFFB8C0FF),
    "secondary": Color(0xFFFDE2E4),
    "accent": Color(0xFFFFB4A2),
    "background": Color(0xFFF8F9FA),
    "surface": Color(0xFFEAEAEA),
    "textPrimary": Color(0xFF343A40),
    "textSecondary": Color(0xFF6C757D),
    "error": Color(0xFFB00020),
    "success": Color(0xFF4CAF50),
  };

  // 4. Vibrant & Energetic
  static const Map<String, Color> vibrantTheme = {
    "primary": Color(0xFFFB8500),
    "secondary": Color(0xFF023047),
    "accent": Color(0xFF219EBC),
    "background": Color(0xFFFDFCDC),
    "surface": Color(0xFFE0E0E0),
    "textPrimary": Color(0xFF1D3557),
    "textSecondary": Color(0xFFFB8500),
    "error": Color(0xFFD32F2F),
    "success": Color(0xFF388E3C),
  };

  // 5. Your Custom Theme
  static const Map<String, Color> customTheme = {
    "primary": Color(0xFF165BAA),
    "secondary": Color(0xFFA155B9),
    "accent": Color(0xFFF765A3),
    "background": Color(0xFFF9D1D1),
    "surface": Color(0xFFFFA4B6),
    "textPrimary": Color(0xFF030831),
    "textSecondary": Color(0xFF165BAA),
    "error": Color(0xFFB00020),
    "success": Color(0xFF4CAF50),
  };

  static Map<String, Color> currentTheme = modernMinimal;

  static Color get primary => currentTheme["primary"]!;
  static Color get secondary => currentTheme["secondary"]!;
  static Color get accent => currentTheme["accent"]!;
  static Color get background => currentTheme["background"]!;
  static Color get surface => currentTheme["surface"]!;
  static Color get textPrimary => currentTheme["textPrimary"]!;
  static Color get textSecondary => currentTheme["textSecondary"]!;
  static Color get error => currentTheme["error"]!;
  static Color get success => currentTheme["success"]!;
}
