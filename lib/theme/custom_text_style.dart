import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeGray800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray800,
      );
  static get bodyLargeInter => theme.textTheme.bodyLarge!.inter;
  static get bodyLargeInter18 => theme.textTheme.bodyLarge!.inter.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeLight => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeLight_1 => theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeOutfit => theme.textTheme.bodyLarge!.outfit.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: const Color(0XFF000000),
      );
  static get bodyMediumInterPrimaryContainer =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 14.fSize,
      );
  static get bodyMediumInterWhiteA700 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumInterff000000 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: const Color(0XFF000000),
      );
  static get bodyMediumInterff00000014 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: const Color(0XFF000000),
        fontSize: 14.fSize,
      );
  static get bodyMediumInterff1e1e1e =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: const Color(0XFF1E1E1E),
        fontSize: 14.fSize,
      );
  static get bodyMediumMontserratBlue800 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.blue800,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumMontserratPrimary =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 13.fSize,
      );
  static get bodySmallOutfitSecondaryContainer =>
      theme.textTheme.bodySmall!.outfit.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallRegular => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get bodySmallRegular11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallff000000 => theme.textTheme.bodySmall!.copyWith(
        color: const Color(0XFF000000),
        fontSize: 11.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallff000000Regular => theme.textTheme.bodySmall!.copyWith(
        color: const Color(0XFF000000),
        fontWeight: FontWeight.w400,
      );
  // Display text style
  static get displayMediumLight => theme.textTheme.displayMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get displayMediumWhiteA700 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  // Headline text style
  static get headlineLargeInterWhiteA700 =>
      theme.textTheme.headlineLarge!.inter.copyWith(
        color: appTheme.whiteA700,
      );
  static get headlineLargeInterffffffff =>
      theme.textTheme.headlineLarge!.inter.copyWith(
        color: const Color(0XFFFFFFFF),
      );
  static get headlineLargeLight => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get headlineLargeOnPrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallInterRedA700 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.redA700,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallInterWhiteA700 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallLight => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get headlineSmallMontserrat =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallMontserratLight =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get headlineSmallMontserratOnPrimary =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get headlineSmallMontserratWhiteA700 =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w300,
      );
  // Label text style
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  // Title text style
  static get titleLargeMontserrat =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get titleLargeMontserrat_1 => theme.textTheme.titleLarge!.montserrat;
  static get titleLargePrimaryContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleLargeff000000 => theme.textTheme.titleLarge!.copyWith(
        color: const Color(0XFF000000),
      );
  static get titleLargeffffffff => theme.textTheme.titleLarge!.copyWith(
        color: const Color(0XFFFFFFFF),
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter;
}

extension on TextStyle {
  TextStyle get outfit {
    return copyWith(
      fontFamily: 'Outfit',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get murecho {
    return copyWith(
      fontFamily: 'Murecho',
    );
  }
}
