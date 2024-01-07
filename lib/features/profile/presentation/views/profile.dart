import 'package:flutter/material.dart';
import 'package:seismic_update/features/profile/presentation/widgets/card_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Seismic Updates',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Icon(
                  Icons.monitor_heart_outlined,
                  size: 100,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Seismic Updates adalah aplikasi yang dikembangkan untuk menyediakan informasi gempa bumi secara terkini dari data BMKG terkini. Tujuannya adalah meningkatkan kesadaran masyarakat terhadap risiko gempa bumi dan menyediakan alat yang efektif untuk respons cepat selama situasi darurat.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Developer Profile:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                CardProfile(
                    nama: "Muhammad Arkan Adli",
                    umur: "20",
                    nrp: '152021168',
                    imgUrl: 'assets/images/fotoarkan.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
