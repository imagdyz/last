import '../../../utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final Widget text;
  final Function()? onTap;
  final double? verticall;
  final double? horizontall;
  const CustomButtom({
    super.key,
    required this.text,
    this.onTap,
    this.verticall,
    this.horizontall,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultHorizontal = context.responsive<double>(
      mobile: screenWidth * 0.35,
      tablet: 120,
      desktop: 140,
    );
    final defaultVertical = context.responsive<double>(
      mobile: 16,
      tablet: 18,
      desktop: 18,
    );
    final horizontal = horizontall ?? defaultHorizontal;
    final vertical = verticall ?? defaultVertical;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: text),
      ),
    );
  }
}
