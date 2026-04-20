import '../../../utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = context.responsive<double>(
      mobile: MediaQuery.of(context).size.width * 0.85,
      tablet: 380,
      desktop: 420,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(context.responsive<double>(mobile: 16, tablet: 20, desktop: 24)),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Image.asset(
              'assets/images/ae66c79b-ae4f-4453-8404-90947ce39351.png',
              fit: BoxFit.contain,
              width: maxWidth,
            ),
          ),
        ),
      ],
    );
  }
}
