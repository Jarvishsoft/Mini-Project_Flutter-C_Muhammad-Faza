import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:hikeabis_app/login_page/login_page.dart';
// ignore: unused_import
import 'package:get/get.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0 : Home',
      style: optionStyle,
    ),
    Text(
      'Index 1 : Search',
      style: optionStyle,
    ),
    Text(
      'Index 2 : Pesanan',
      style: optionStyle,
    ),
    Text(
      'Index 3 : Akun',
      style: optionStyle,
    ),
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
        child: _widgetOptions.elementAt(selectedIndex),
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
