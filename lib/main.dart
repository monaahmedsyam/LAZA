import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/onboarding_screen.dart';
import 'screens/get_started_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/address_screen.dart';
import 'screens/order_confirmed_screen.dart';

void main() {
  runApp(const LazaApp());
}

class LazaApp extends StatelessWidget {
  const LazaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        primaryColor: AppColors.primary,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/get-started': (context) => const GetStartedScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/wishlist': (context) => const WishlistScreen(),
        '/product-detail': (context) => const ProductDetailScreen(),
        '/address': (context) => const AddressScreen(),
        '/order-confirmed': (context) => const OrderConfirmedScreen(),
      },
    );
  }
}
