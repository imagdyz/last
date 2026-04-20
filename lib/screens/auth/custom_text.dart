import '../../utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final Function()? onTap;
  final bool fitted;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.weight,
    this.size,
    this.fontFamily,
    this.onTap,
    this.fitted = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseSize = size ?? 14;
    final responsiveSize = context.responsive<double>(
      mobile: baseSize,
      tablet: baseSize * 1.05,
      desktop: baseSize * 1.1,
    );
    final textWidget = Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: weight,
        fontSize: responsiveSize,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: fitted ? 1 : null,
    );
    final child = fitted
        ? FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: textWidget,
          )
        : textWidget;
    return GestureDetector(onTap: onTap, child: child);
  }
}
