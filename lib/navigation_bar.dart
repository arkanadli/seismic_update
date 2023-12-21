// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seismic_update/features/gempa/presentation/views/home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:seismic_update/features/kontak/presentation/views/kontak.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        itemPadding: const EdgeInsets.all(18),
        currentIndex: currentPage,
        onTap: (i) {
          currentPage = i;
          setState(() {});
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Seismic"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Contacts"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: const [
          GempaScreen(),
          KontakScreen(),
          Text('asdasd324'),
          Text('asdasd1sda'),
        ],
      ),
    );
  }
}
