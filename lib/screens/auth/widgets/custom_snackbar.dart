import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore_for_file: non_constant_identifier_names

SnackBar customSnackBar(String text) {
  return SnackBar(
    padding: EdgeInsets.all(10),
    // elevation: 10,
    clipBehavior: Clip.none,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red.shade900,
    content: Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
        ), // Changed icon and made const
        const Gap(10), // Made const
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
