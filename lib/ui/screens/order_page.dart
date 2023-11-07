import 'package:flutter/material.dart';
import 'package:hikeabis_app/data/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          icon: const Icon(
            Icons.close_rounded,
            size: 72,
            color: Color.fromARGB(255, 255, 4, 4),
          ),
          title: const Text(
            'PESANAN ANDA DIBATALKAN!',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: const Text(
            'Booking telah dibatalkan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  'Oke!',
                  style: TextStyle(color: Colors.red),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Booking',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Consumer<OrderProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: value.orders.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.amber.shade100,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: ListTile(
                          title: Text(value.orders[index].nama),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('NIK : ${value.orders[index].nik}'),
                              Text('No. Telp : ${value.orders[index].noTelp}'),
                              Text('Email : ${value.orders[index].email}'),
                              Text('Usia : ${value.orders[index].usia}'),
                              Text('Alamat : ${value.orders[index].alamat}'),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              _showDialog();
                              value.removeOrderModels(
                                  index, value.orders[index]);
                            },
                            icon: const Icon(Icons.delete_forever),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
