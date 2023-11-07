import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/data/providers/auth_provider.dart';
import 'package:hikeabis_app/data/authentication/login.dart';
import 'package:hikeabis_app/data/models/user_model.dart';
import 'package:provider/provider.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, resultState, _) {
      UserModel? user = resultState.user;
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/prau-1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('Name : ${user!.name}'),
              const SizedBox(height: 5),
              Text('Email : ${user.email}'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF968989),
                  padding: const EdgeInsets.all(18),
                  shape: const StadiumBorder(),
                ),
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.offAll(const LoginPage());
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF968989),
                  padding: const EdgeInsets.all(18),
                  shape: const StadiumBorder(),
                ),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
