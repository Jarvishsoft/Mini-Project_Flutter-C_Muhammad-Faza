import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/data/authentication/auth_provider.dart';
import 'package:hikeabis_app/data/authentication/login.dart';
import 'package:hikeabis_app/ui/widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

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
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Create Account,",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign Up to Get Started!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Fullname",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                    controller: _nameController,
                    hintText: 'Type your fullname',
                    prefixIcon: const Icon(Icons.person_outline)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                    controller: _userController,
                    hintText: 'Type your username',
                    prefixIcon: const Icon(Icons.person)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _emailController,
                  hintText: 'Type your email',
                  prefixIcon: const Icon(Icons.email),
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                    controller: _passwordController,
                    hintText: 'Type your password',
                    prefixIcon: const Icon(Icons.lock),
                    passwordMode: true),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0XFF47597E),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 0.25),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    if (await resultState.register(
                      name: _nameController.text,
                      username: _userController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    )) {
                      Get.to(() => const LoginPage());
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Gagal Register! | Gunakan username atau email lain',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black.withOpacity(0.75)),
                    ),
                    TextButton(
                      onPressed: () => Get.offAll(() => const LoginPage()),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hikeabis_app/data/authentication/signup.dart';

// class LoginRegister extends StatefulWidget {
//   const LoginRegister({super.key});

//   @override
//   State<LoginRegister> createState() => _LoginRegisterState();
// }

// class _LoginRegisterState extends State<LoginRegister> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Gambar latar belakang yang memenuhi seluruh layar
//           Container(
//             decoration: const BoxDecoration(
//                 // image: DecorationImage(
//                 //   image: AssetImage('assets/bg.JPG'),
//                 //   fit: BoxFit.cover,
//                 // ),
//                 ),
//           ),
//           // Konten tengah dengan logo dan tombol
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // logo aplikasi
//                 Image.asset(
//                   'assets/hikeabis_logo.png',
//                   width: 300,
//                   height: 300,
//                 ),
//                 const SizedBox(height: 10),
//                 const Center(
//                   child: Text(
//                     'Your best partner in summits travel',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 ElevatedButton(
//                   onPressed: () {
//                     // Aksi ketika tombol "Login" ditekan
//                     Get.to(const SignUp());
//                   },
//                   child: const Text('Sign Up'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Aksi ketika tombol "Register" ditekan
//                   },
//                   child: const Text('Login'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }