import '../../../utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? icons;
  final bool? ispassword;
  final TextEditingController? type;
  final FormFieldValidator<String>? validatorr;

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.icons,
    this.ispassword,
    this.type,
    this.validatorr,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = context.responsive<double>(
      mobile: 15,
      tablet: 16,
      desktop: 16,
    );
    return TextFormField(
      validator: validatorr,
      controller: type,
      obscureText: ispassword ?? false,
      decoration: InputDecoration(
        suffixIcon: icons,
        filled: true,
        fillColor: Colors.white,

        // 🏷️ تنسيق الـ Label والـ Hint
        labelText: hintText,
        labelStyle: TextStyle(color: const Color.fromARGB(182, 158, 158, 158)),
        hintStyle: TextStyle(color: const Color.fromARGB(117, 158, 158, 158)),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.red, width: 2.5),
        ),
      ),
    );
  }
}
