import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/data/models/order_model.dart';
import 'package:hikeabis_app/data/providers/order_provider.dart';
import 'package:hikeabis_app/ui/screens/book_home_page.dart';
import 'package:hikeabis_app/ui/widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _noTelp = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _usia = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  bool isCheck = false;

  @override
  void dispose() {
    _nama.dispose();
    _alamat.dispose();
    _email.dispose();
    _nik.dispose();
    _usia.dispose();
    _noTelp.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          icon: const Icon(
            Icons.check_circle_outline_rounded,
            size: 72,
            color: Colors.green,
          ),
          title: const Text(
            'SUKSES!',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: const Text(
            'Booking Anda telah berhasil, silakan melakukan pembayaran yaa',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.offAll(const BookHomePage());
              },
              child: const Center(
                child: Text(
                  'Oke!',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    'INFORMASI BOOKING',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              const Text(
                'Harga Tiket Wisatawan Lokal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Weekdays  : Rp. 35.000,-\'\nWeekend   : Rp. 40.000,-\'\nAktifitas     : Rp. 25.000,-\'',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              const Text(
                'Harga Tiket Wisatawan Asing\n(Foreign Tourist Ticket Prices)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Weekdays  : \$ 35.00\nWeekend   : \$ 40.00\nActivity      : \$ 25.00',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '* Simaksi tertera hanya diperuntukkan tiket PNBP.\n* Harga simaksi dapat berubah sewaktu-waktu.\n* Belum termausk biaya jasa wisata lokal, asuransi, & biaya pengelolaan basecamp.',
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Nama Pendaki',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _nama,
                          hintText: 'Masukkan nama Anda',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'NIK Pendaki',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _nik,
                          hintText: 'Masukkan NIK Anda',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'No. Telp',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _noTelp,
                          hintText: 'No. telp ',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _email,
                          hintText: 'Masukkan email yang valid',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            final isEmailValidation =
                                EmailValidator.validate(value);
                            if (!isEmailValidation) {
                              return 'Masukkan email yang valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Usia',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _usia,
                          hintText: 'Usia anda',
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Alamat (sesuai KTP)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _alamat,
                          hintText: 'Alamat sesuai KTP Anda',
                        ),
                        const SizedBox(height: 40),
                        const Divider(color: Colors.black54),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
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
                    setState(
                      () {
                        String nama = _nama.text;
                        String nik = _nik.text;
                        String noTelp = _noTelp.text;
                        String email = _email.text;
                        String usia = _usia.text;
                        String alamat = _alamat.text;

                        if (nama.isNotEmpty &&
                            nik.isNotEmpty &&
                            noTelp.isNotEmpty &&
                            email.isNotEmpty &&
                            usia.isNotEmpty &&
                            alamat.isNotEmpty)
                        // if (_formKey.currentState!.validate())
                        {
                          Provider.of<OrderProvider>(context, listen: false)
                              .addOrderModels(
                            OrderModels(
                              nama: _nama.text,
                              nik: _nik.text,
                              noTelp: _noTelp.text,
                              email: _email.text,
                              usia: _usia.text,
                              alamat: _alamat.text,
                            ),
                          );
                          _showDialog();
                          _nama.clear();
                          _nik.clear();
                          _noTelp.clear();
                          _email.clear();
                          _usia.clear();
                          _alamat.clear();
                        }
                      },
                    );
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
                child: const Text(
                  'Setuju & Tambah Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
