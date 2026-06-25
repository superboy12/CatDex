import 'package:flutter/material.dart';

class AppTheme {
  // === COLOR PALETTE ===
  static const Color primary = Color(0xFFFF7043);        // Warm orange
  static const Color primaryLight = Color(0xFFFFAB91);   // Soft orange
  static const Color secondary = Color(0xFFAB47BC);      // Purple
  static const Color secondaryLight = Color(0xFFCE93D8); // Soft purple
  static const Color accent = Color(0xFFFFCA28);         // Yellow gold
  static const Color background = Color(0xFFFFF8F5);     // Warm white
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF2D1B0E);    // Dark brown
  static const Color textSecondary = Color(0xFF8D6E63);  // Brown grey

  // === RARITY COLORS ===
  static const Color rarityCommon = Color(0xFF78909C);
  static const Color rarityUncommon = Color(0xFF43A047);
  static const Color rarityRare = Color(0xFF1E88E5);
  static const Color rarityEpic = Color(0xFF8E24AA);
  static const Color rarityLegendary = Color(0xFFFFB300);

  // === GRADIENTS ===
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF7043), Color(0xFFAB47BC)],
  );

  static const LinearGradient cardGradientCommon = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF78909C), Color(0xFF546E7A)],
  );

  static const LinearGradient cardGradientRare = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
  );

  static const LinearGradient cardGradientEpic = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
  );

  static const LinearGradient cardGradientLegendary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE65100), Color(0xFFFFB300)],
  );

  static LinearGradient getCardGradient(String rarity) {
    switch (rarity) {
      case 'Rare': return cardGradientRare;
      case 'Epic': return cardGradientEpic;
      case 'Legendary': return cardGradientLegendary;
      default: return cardGradientCommon;
    }
  }

  static Color getRarityColor(String rarity) {
    switch (rarity) {
      case 'Uncommon': return rarityUncommon;
      case 'Rare': return rarityRare;
      case 'Epic': return rarityEpic;
      case 'Legendary': return rarityLegendary;
      default: return rarityCommon;
    }
  }

  static String getRarityEmoji(String rarity) {
    switch (rarity) {
      case 'Uncommon': return '🌿';
      case 'Rare': return '💎';
      case 'Epic': return '⚡';
      case 'Legendary': return '🌟';
      default: return '🐾';
    }
  }
}
