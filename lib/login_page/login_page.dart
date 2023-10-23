import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/screen_page/book_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  String password = '1234567890';
  late SharedPreferences loginPrefs;
  late bool newUser;

  void checkLogin() async {
    loginPrefs = await SharedPreferences.getInstance();
    newUser = loginPrefs.getBool('login') ?? true;
    // ignore: avoid_print
    print(newUser);

    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const BookPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 28,
                ),
                const Text(
                  'Masukkan data Anda',
                  style: TextStyle(),
                ),
                // text form field username & validation
                TextFormField(
                  controller: _userController,
                  decoration: const InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan nama Anda',
                      icon: Icon(Icons.person_2_rounded)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan nama Anda';
                    }
                    return null;
                  },
                ),
                // text form field email & validation
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Masukkan email Anda',
                    icon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan email Anda';
                    }
                    final isEmailValidation = EmailValidator.validate(value);
                    if (!isEmailValidation) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                // text form field password & validation
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Masukkan password Anda',
                    icon: Icon(Icons.password_rounded),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan password Anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    final isValidate = _formKey.currentState!.validate();
                    String username = _userController.text;
                    // ignore: avoid_print
                    print(username);
                    String pass = _passwordController.text;
                    // ignore: avoid_print
                    print(pass);

                    if (isValidate) {
                      if (pass != password) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password is incorrect'),
                          ),
                        );
                      } else {
                        loginPrefs.setBool('login', false);
                        loginPrefs.setString('username', username);

                        Get.to(const BookPage());
                      }
                    }
                  },
                  child: const Text('Masuk'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
