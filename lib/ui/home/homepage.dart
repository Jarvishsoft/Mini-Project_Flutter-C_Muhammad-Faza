import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikeabis_app/data/authentication/auth_provider.dart';
import 'package:hikeabis_app/data/models/user_model.dart';
import 'package:hikeabis_app/ui/screens/booking_page.dart';
import 'package:hikeabis_app/ui/screens/panduan_page.dart';
import 'package:hikeabis_app/ui/screens/sop.dart';
import 'package:hikeabis_app/ui/screens/syarat_booking_page.dart';
import 'package:hikeabis_app/ui/widgets/custom_itemmenu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class MenuItem {
  final String title;
  final IconData icon;

  MenuItem(this.title, this.icon);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, resultState, _) {
        UserModel? user = resultState.user;
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Image(
                    image: AssetImage('assets/hikeabis_logo.png'),
                    fit: BoxFit.contain,
                    width: 120,
                    height: 120,
                  ),
                ),
                const Text(
                  '"Your best partner for mountain hiking!"',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hi ${user!.name},',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Welcome to Hike Abis!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Colors.black54),
                      Column(
                        children: <Widget>[
                          const Text(
                            'Menu Aplikasi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          // ------- Menu Aplikasi -------
                          // --- Row 1 ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {
                                    Get.offAll(const BookingPage());
                                  },
                                  child: const ItemKategori(
                                    title: 'Booking \n\tOnline',
                                    icon: 'assets/tiket.png',
                                    width: 65,
                                    height: 60,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {},
                                  child: const ItemKategori(
                                    title: '\t\tDaftar \nGunung',
                                    icon: 'assets/gunung.png',
                                    width: 65,
                                    height: 60,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {
                                    Get.offAll(const PanduanBooking());
                                  },
                                  child: const ItemKategori(
                                    title: '\t\tPanduan \n\t\tBooking',
                                    icon: 'assets/panduan.png',
                                    width: 65,
                                    height: 60,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          // --- Row 2 ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {},
                                  child: const ItemKategori(
                                    title: 'Cek Kuota',
                                    icon: 'assets/cek_kuota.png',
                                    width: 65,
                                    height: 60,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {},
                                  child: const ItemKategori(
                                    title: 'Warta Gunung',
                                    icon: 'assets/berita.png',
                                    width: 65,
                                    height: 60,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {
                                    Get.offAll(const SOP());
                                  },
                                  child: const ItemKategori(
                                    title: 'SOP',
                                    icon: 'assets/sop.png',
                                    width: 65,
                                    height: 60,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          // --- Row 3 ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {
                                    Get.offAll(const SyaratBookingPage());
                                  },
                                  child: const ItemKategori(
                                    title: 'Syarat Booking',
                                    icon: 'assets/persyaratan.png',
                                    width: 65,
                                    height: 60,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Material(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: Icon(Icons.more_horiz_rounded, size: 30),
                          ),
                          Text('more'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
