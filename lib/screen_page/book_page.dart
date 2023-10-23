import 'package:flutter/material.dart';
import 'package:hikeabis_app/home/homepage.dart';
// ignore: unused_import
import 'package:hikeabis_app/login_page/login_page.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:hikeabis_app/screen_page/akun_page.dart';
import 'package:hikeabis_app/screen_page/pesanan_page.dart';
import 'package:hikeabis_app/screen_page/search_page.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  int selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _page = <Widget>[
    HomePage(),
    SearchPage(),
    PesananPage(),
    AkunPage(),
  ];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HikeAbis'),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 104, 88, 177),
        shadowColor: Colors.black45,
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      ),
      body: Center(
        child: _page.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 47, 3, 128),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Color.fromARGB(255, 92, 87, 71),
          ),
          // masih bingung mau diisi apa
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
            // backgroundColor: Color.fromARGB(255, 92, 87, 71),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_rounded),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Akun',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 59, 59, 59),
        onTap: _onItemTapped,
      ),
    );
  }
}
