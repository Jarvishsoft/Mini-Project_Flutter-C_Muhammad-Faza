import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutDialog(
        applicationIcon: FlutterLogo(),
        applicationName: 'Hike Abis',
        applicationVersion: '5.0.0',
        children: [
          Text('Hike Abis'),
        ],
      ),
    );
  }
}
