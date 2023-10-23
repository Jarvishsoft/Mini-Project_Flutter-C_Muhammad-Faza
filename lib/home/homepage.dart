import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hi, welcome to Hike Abis!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        toolbarHeight: 60,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('Hi, welcome to Hike Abis!'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
