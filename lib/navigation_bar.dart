// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seismic_update/features/gempa/presentation/views/home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:seismic_update/features/kontak/presentation/views/kontak.dart';
import 'package:seismic_update/features/profile/presentation/views/profile.dart';

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
      appBar: AppBar(
        title: const Text(
          "Seismic Update",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        scrolledUnderElevation: 0,
        actions: [
          SizedBox(
            width: 50,
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
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
            icon: const Icon(Icons.monitor_heart_outlined),
            title: const Text("Seismic"),
            selectedColor: Colors.green,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.contact_phone_outlined),
            title: const Text("Contacts"),
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
          ProfileScreen(),
        ],
      ),
    );
  }
}
