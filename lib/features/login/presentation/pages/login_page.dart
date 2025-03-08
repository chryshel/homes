import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homzes_app/core/navigation/context_router.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_bloc.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_event.dart';
import 'package:homzes_app/features/home/presentation/pages/home_page.dart';

import '../../../../core/app/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final categories = [
    CategoryCard(
        title: 'Rent',
        icon: Icons.chair_outlined,
        color: Colors.orange.shade100),
    CategoryCard(
        title: 'Buy',
        icon: Icons.apartment_outlined,
        color: Colors.yellow.shade200),
    CategoryCard(
        title: 'Sell', icon: Icons.sell_outlined, color: Colors.blue.shade100),
    CategoryCard(
        title: 'Lease',
        icon: Icons.home_outlined,
        color: Colors.orange.shade100),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   //context.goTo(HomePage.pathName);
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              Images.loginImage,
              fit: BoxFit.cover,
            ),
          ),

          // Dark Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Homzes',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      CircularMenuButton(),
                    ],
                  ),
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    'Find the best\nplace for you',
                    style: TextStyle(
                      height: 1,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CategoryCard(
                          title: categories[index].title,
                          icon: categories[index].icon,
                          color: categories[index].color),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomButton(
                    text: 'Create an account',
                    onPressed: () {
                      context.read<RentalsBloc>().add(OnGetRentals());
                      context.go(HomePage.pathName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CategoryCard({
    required this.title,
    required this.icon,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.34,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(icon, size: 25, color: Colors.black),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * 0.27, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onPressed,
      child: Text(text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }
}

class CircularMenuButton extends StatelessWidget {
  const CircularMenuButton({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: screenWidth * 0.005),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.menu_outlined, size: 24, color: Colors.white),
    );
  }
}
