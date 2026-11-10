import 'package:flutter/material.dart';
import '../constants.dart';

class BackButtonCircle extends StatelessWidget {
  const BackButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.fieldBg,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back_rounded, color: AppColors.textDark),
      ),
    );
  }
}
