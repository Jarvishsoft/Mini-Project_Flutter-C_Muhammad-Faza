import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:hikeabis_app/data/providers/order.dart';
import 'package:hikeabis_app/ui/home/homepage.dart';
import 'package:hikeabis_app/ui/screens/akun_page.dart';
import 'package:hikeabis_app/ui/screens/order_page.dart';
import 'package:hikeabis_app/ui/screens/rekomendasi_page.dart';

void main() {
  runApp(const MaterialApp(
    home: BookHomePage(),
  ));
}

class BookHomePage extends StatefulWidget {
  const BookHomePage({super.key});

  @override
  State<BookHomePage> createState() => _BookHomePageState();
}

class _BookHomePageState extends State<BookHomePage> {
  PageController _pageController = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: const [HomePage(), OrderPage(), Rekomendasi(), AkunPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: const Color.fromARGB(255, 59, 59, 59),
        currentIndex: selectedIndex,
        iconSize: 24,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 1
                ? Icons.book_online_rounded
                : Icons.book_online_outlined),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 2
                ? Icons.recommend_rounded
                : Icons.recommend_outlined),
            label: 'Rekomendasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 3
                ? Icons.person_2_rounded
                : Icons.person_2_outlined),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
