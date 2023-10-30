import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:hikeabis_app/data/authentication/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future timeSplash() async {
    Timer(const Duration(seconds: 6), () {
      Get.offAll(() => const LoginPage());
    });
  }

  @override
  void initState() {
    timeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 143, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Image(
                image: AssetImage('assets/hikeabis_logo.png'),
              ),
              SizedBox(height: 15),
              Text(
                '"Your best partner for mountain hiking!"',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
