import 'package:flutter/material.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  final List<Map<String, String>> _brands = const [
    {'name': 'Adidas', 'logo': 'A'},
    {'name': 'Nike', 'logo': 'N'},
    {'name': 'Fila', 'logo': 'F'},
    {'name': 'Puma', 'logo': 'P'},
  ];

  final List<Map<String, String>> _products = const [
    {
      'title': 'Nike Sportswear Club Fleece',
      'price': '\$99',
      'image':'image/images3d.png',
    },
    {
      'title': 'Trail Running Jacket Nike Windrunner',
      'price': '\$99',
      'image':'image/imageson.png'
    },
    {
      'title': 'Nike Sportswear Tee',
      'price': '\$59',
      'image': 'image/man.png',
    },
    {
      'title': 'Nike Puffer Jacket',
      'price': '\$149',
      'image': 'image/images3d2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _roundIcon(Icons.menu_sharp),
                  _roundIcon(Icons.shopping_bag_outlined),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text('Hello', style: AppTextStyles.heading),
              const Text('Welcome to Laza.', style: AppTextStyles.subheading),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.fieldBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search_sharp, color: AppColors.textGrey),
                          SizedBox(width: AppSpacing.sm),
                          Text('Search...', style: AppTextStyles.label),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.mic, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              _sectionHeader('Choose Brand'),
              const SizedBox(height: AppSpacing.sm),
              SizedBox(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _brands.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final brand = _brands[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.fieldBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Text(brand['logo']!,
                              style: const TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Text(brand['name']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _sectionHeader('New Arraival'),
              const SizedBox(height: AppSpacing.sm),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        Icons.image, size: 40,
                                        color: AppColors.textGrey),
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 8,
                                right: 8,
                                child: Icon(Icons.favorite_outline_rounded,
                                    color: AppColors.textGrey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(product['title']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text(product['price']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (i) {
          setState(() => _navIndex = i);
          if (i == 1) {
            Navigator.pushNamed(context, '/wishlist');
          }
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textGrey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
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

  Widget _roundIcon(IconData icon) => Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: AppColors.fieldBg,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.textDark),
      );

  Widget _sectionHeader(String title) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('View All', style: AppTextStyles.label),
        ],
      );
}
