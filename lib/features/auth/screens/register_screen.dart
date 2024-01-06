import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seismic_update/features/auth/auth_check.dart';
import 'package:seismic_update/features/auth/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  OutlineInputBorder border() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.white));
  }

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  late bool _passwordNonVisible;
  Future<void> signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty) {
      // Show an error dialog if any of the fields is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('All fields must be filled out.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return; // Exit the function if any of the fields is empty
    }

    if (passwordConfirmed()) {
      // Show a loading dialog
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      try {
        // Create a user account
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Add additional user information
        addUserDetails(
          firstName: firstName,
          lastName: lastName,
          email: email,
        );

        Navigator.of(context).popUntil(
          (route) => route.isFirst,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthStateCheck(),
          ),
        );
      } catch (e) {
        // Handle account creation errors
        print('Error creating account: $e');
        // Display an error message to the user if needed
        // ...
      }
    } else {
      // Show a message if password confirmation doesn't match
      print('Passwords do not match');
    }
  }

  Future addUserDetails({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    await FirebaseFirestore.instance
        .collection("users")
        .add({"first name": firstName, "last name": lastName, "email": email});
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordNonVisible = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Text(
                  'Register Account',
                  style: TextStyle(fontSize: 44),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Be part of our community",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      border: border(),
                      filled: true,
                      fillColor: Colors.white54,
                      hintText: 'First Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      border: border(),
                      filled: true,
                      fillColor: Colors.white54,
                      hintText: 'Last Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: border(),
                      filled: true,
                      fillColor: Colors.white54,
                      hintText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _passwordNonVisible,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordNonVisible = !_passwordNonVisible;
                          });
                        },
                        child: const Icon(Icons.visibility),
                      ),
                      border: border(),
                      filled: true,
                      fillColor: Colors.white54,
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _confirmController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: border(),
                        filled: true,
                        fillColor: Colors.white54,
                        hintText: 'Confirm Password'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 60,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: signUp,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      },
                      child: const Text(
                        'Login now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
