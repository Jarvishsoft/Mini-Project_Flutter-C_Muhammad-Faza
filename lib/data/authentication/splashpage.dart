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
      backgroundColor: Color.fromARGB(252, 218, 228, 248),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.all(16),
                child: Image(
                  image: AssetImage('assets/hikeabis_logo.png'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '"Your best partner for mountain hiking!"',
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
