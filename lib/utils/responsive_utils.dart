import 'package:flutter/material.dart';

import 'breakpoints.dart';

/// Extensions for responsive layout calculations.
extension ResponsiveContext on BuildContext {
  /// Returns the current screen type based on width.
  ScreenType get screenType {
    final width = MediaQuery.of(this).size.width;
    if (width < Breakpoints.mobile) return ScreenType.mobile;
    if (width <= Breakpoints.tablet) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get textScaleFactor => MediaQuery.of(this).textScaler.scale(1);

  /// Returns a value scaled by breakpoint.
  /// [mobile] < 600, [tablet] 600-1024, [desktop] > 1024
  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    switch (screenType) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet ?? mobile;
      case ScreenType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  /// Returns value as percentage of screen width (0.0 - 1.0).
  double widthPercent(double percent) => screenWidth * percent;

  /// Returns value as percentage of screen height (0.0 - 1.0).
  double heightPercent(double percent) => screenHeight * percent;
}

extension ResponsiveValues on BuildContext {
  /// Base padding - scales with screen size.
  double get basePadding => responsive<double>(mobile: 14, tablet: 24, desktop: 32);

  /// Standard gap between sections.
  double get sectionGap => responsive<double>(mobile: 24, tablet: 32, desktop: 40);

  /// Top spacing for auth screens.
  double get authTopSpacing => responsive<double>(mobile: 60, tablet: 80, desktop: 100);

  /// Constrains content width on desktop for readability.
  double get maxContentWidth => responsive<double>(
        mobile: MediaQuery.of(this).size.width,
        tablet: 500,
        desktop: 480,
      );

  /// Cross axis count for grids (short items like symptom chips).
  int get gridCrossAxisCount => responsive<int>(mobile: 2, tablet: 3, desktop: 4);

  /// Cross axis count for symptom chips in list layout.
  int get symptomGridCount => responsive<int>(mobile: 2, tablet: 3, desktop: 4);
}
