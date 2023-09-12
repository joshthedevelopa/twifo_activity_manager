import '../imports.dart';

extension BuildContextResponsive on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  bool get isMobile => screenSize.width < BreakpointConst.mobile;
  bool get isDesktop => screenSize.width >= BreakpointConst.tablet;
  bool get isTablet => !isDesktop && !isMobile;
}

class ResponsizeWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? desktop;
  final Widget? tablet;

  const ResponsizeWidget({
    super.key,
    required this.mobile,
    this.desktop,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const int mobilePoint = BreakpointConst.mobile;
    const int tabletPoint = BreakpointConst.tablet;

    return switch (size.width) {
      (<= mobilePoint) => mobile,
      (< tabletPoint && > mobilePoint) => tablet ?? mobile,
      (_) => desktop ?? mobile,
    };
  }
}
