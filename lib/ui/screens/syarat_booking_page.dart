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
              const Text(
                'Persetujuan mentaati peraturan yang sudah ditentukan.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheck = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 10,
                      ),
                      child: Text(
                          'Saya sanggup mengikuti dan mematuhi semua peraturan yang telah diterapkan dan ditentukan pada yang telah tertera dan pada masing-masing basecamp gunung yang akan dituju untuk pendakian, dan akan bertanggungjawab serta menerima sanksi apabila didapati melanggar peraturan.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 137, 137),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(22),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  if (isCheck) {
                    Get.offAll(const BookHomePage());
                    // ignore: avoid_print
                    print('Okee, terima kasih');
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          title: const Text(
                            'Validasi Gagal Boy!',
                            style: TextStyle(
                              // fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Text(
                              'Harap setujui peraturan terlebih dahulu yaa.'),
                          shadowColor: Colors.black12,
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'OKE',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 60),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Setuju & Lanjutkan'),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
