import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seismic_update/features/auth/screens/login_screen.dart';
import 'package:seismic_update/features/gempa/presentation/views/home.dart';
import 'package:seismic_update/navigation_bar.dart';

class AuthStateCheck extends StatelessWidget {
  const AuthStateCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavigationBarScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
