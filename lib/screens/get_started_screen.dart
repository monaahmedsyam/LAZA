import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../constants.dart';
import '../widgets/back_button_circle.dart';
import '../widgets/primary_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButtonCircle(),
                    const SizedBox(height: AppSpacing.xl),
                    const Text("Let's Get Started", style: AppTextStyles.heading),
                    const SizedBox(height: 80),
                    _SocialButton(
                      text: 'Facebook',
                      icon: Icons.facebook,
                      color: AppColors.facebook,
                      onTap: () => Navigator.pushNamed(context, '/home'),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _SocialButton(
                      text: 'Twitter',
                      icon: Icons.close,
                      color: AppColors.twitter,
                      onTap: () => Navigator.pushNamed(context, '/home'),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _SocialButton(
                      text: 'Google',
                      icon: Icons.g_mobiledata,
                      color: AppColors.google,
                      onTap: () => Navigator.pushNamed(context, '/home'),
                    ),
                    const Spacer(),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: AppColors.textGrey, fontSize: 15),
                          children: [
                            const TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Signin',
                              style: const TextStyle(
                                color: AppColors.textDark,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Navigator.pushNamed(context, '/signup'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: PrimaryButton(
                text: 'Create an Account',
                onPressed: () => Navigator.pushNamed(context, '/signup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SocialButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
