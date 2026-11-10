import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/back_button_circle.dart';
import '../widgets/primary_button.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: BackButtonCircle(),
              ),
              Transform.scale(
                scale: 1.3,
                child: Image.asset(
                  'image/imagespreview.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const Text('Order Confirmed!', style: AppTextStyles.heading),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Your order has been confirmed, we will send\nyou confirmation email shortly.',
                textAlign: TextAlign.center,
                style: AppTextStyles.subheading,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Go to Orders',
                color: AppColors.fieldBg,
                textColor: AppColors.textDark,
                onPressed: () =>
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false),
              ),
              const SizedBox(height: AppSpacing.md),
              PrimaryButton(
                text: 'Continue Shopping',
                onPressed: () =>
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
