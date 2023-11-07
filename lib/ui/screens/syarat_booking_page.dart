import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/ui/screens/book_home_page.dart';

class SyaratBookingPage extends StatefulWidget {
  const SyaratBookingPage({super.key});

  @override
  State<SyaratBookingPage> createState() => _SyaratBookingPageState();
}

class _SyaratBookingPageState extends State<SyaratBookingPage> {
  bool isCheck = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    'PERSYARATAN BOOKING PENDAKIAN VIA HIKEABIS MOBILE APP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(height: 25),
              const Text(
                'Bersedia membawa barang yang wajib dibawa (akan di cek di pintu masuk) berupa : ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                    '◾ Jaket\n◾ Sleeping Bag (menginap)\n◾ Nesting (menginap)\n◾ Kompor (menginap)\n◾ Matras (menginap)\n◾ Tenda (menginap)\n◾ Jas Hujan\n◾ Sepatu tracking/Sepatu gunung\n◾ Tumbler/Jerigen\n◾ Wajib membawa masker minimal 3 per orang dan hand sanitizer\n◾ Untuk calon pendaki dibawah usia 15 tahun, wajib melampirkan surat pernyataan dari orang tua dengan tanda tangan di atas materai 10.000'),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.black87),
              const SizedBox(height: 20),
              const SizedBox(height: 30),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 137, 137),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(22),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Get.offAll(const BookHomePage());
                },
                child: const Text(
                  'Setuju & Lanjutkan',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1.8),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
