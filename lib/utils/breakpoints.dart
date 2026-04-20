/// Standard breakpoint system for responsive design.
/// Mobile: < 600 | Tablet: 600-1024 | Desktop: > 1024
class Breakpoints {
  Breakpoints._();

  static const double mobile = 600;
  static const double tablet = 1024;
}

enum ScreenType {
  mobile,
  tablet,
  desktop,
}
