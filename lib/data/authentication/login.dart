import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/data/providers/auth_provider.dart';
import 'package:hikeabis_app/data/authentication/register.dart';
import 'package:hikeabis_app/ui/screens/book_home_page.dart';
import 'package:hikeabis_app/ui/widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCont = TextEditingController();
  final _passwordCont = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _emailCont.dispose();
    _passwordCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, resultState, _) {
      return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: <Widget>[
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/hikeabis_logo.png',
                    width: 180,
                    height: 180,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to Hike Abis,',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Sign In to Continue!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                CustomFormField(
                  controller: _emailCont,
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final isEmailValidation = EmailValidator.validate(value);
                    if (!isEmailValidation) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                CustomFormField(
                  controller: _passwordCont,
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  passwordMode: true,
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color(0xFF968989),
                  ),
                  onPressed: () async {
                    if (await resultState.login(
                      email: _emailCont.text,
                      password: _passwordCont.text,
                    )) {
                      Get.offAll(() {
                        return const BookHomePage();
                      });
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Gagal Login | Username atau password salah!',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(const RegisterPage());
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      );
    });
  }
}
