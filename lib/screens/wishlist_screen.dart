import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/back_button_circle.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _navIndex = 1;

  final List<Map<String, String>> _products = const [
    {
      'title': 'Nike Sportswear Club Fleece',
      'price': '\$99',
      'image':
          ' image/images3d2.png',
    },
    {
      'title': 'Trail Running Jacket Nike Windrunner',
      'price': '\$99',
      'image':
          ' image/images3d2.png',
    },
    {
      'title': 'Training Top Nike Sport Clash',
      'price': '\$99',
      'image':
          ' image/images3d2.png',
    },
    {
      'title': 'Trail Running Jacket Nike Windrunner',
      'price': '\$99',
      'image':
          ' image/images3d2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButtonCircle(),
                  const Text('Wishlist',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: AppColors.fieldBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.shopping_bag_outlined,
                        color: AppColors.textDark),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('365 Items',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const Text('in wishlist', style: AppTextStyles.label),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.edit,
                          size: 18, color: AppColors.textDark),
                      SizedBox(width: 4),
                      Text('Edit',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: GridView.builder(
                  itemCount: _products.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/product-detail'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    color: AppColors.fieldBg,
                                    width: double.infinity,
                                    child: Image.network(
                                      product['image']!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (c, e, s) => const Icon(
                                          Icons.image,
                                          size: 40,
                                          color: AppColors.textGrey),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Icon(Icons.favorite_outline_rounded,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(product['title']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          Text(product['price']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textGrey,
        onTap: (index) {
          setState(() => _navIndex = index);
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_rounded), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Wallet'),
        ],
      ),
    );
  }
}
