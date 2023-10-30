import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/data/authentication/auth_provider.dart';
import 'package:hikeabis_app/data/authentication/splashpage.dart';
import 'package:hikeabis_app/data/providers/booking.dart';
import 'package:hikeabis_app/data/providers/order.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Order()),
        ChangeNotifierProvider(create: (_) => Booking()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo Hike Abis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0XFF47597E),
          centerTitle: true,
        ),
        primaryColor: const Color(0XFF47597E),
      ),
      home: const SplashPage(),
    );
  }
}
