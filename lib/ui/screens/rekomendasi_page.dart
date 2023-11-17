import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:convert';

class Rekomendasi extends StatefulWidget {
  final String result;
  const Rekomendasi({super.key, required this.result});

  @override
  State<Rekomendasi> createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {
  bool resultText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rekomendasi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  resultText ||
                          widget.result.length <=
                              300 // Show full text or first 300 characters
                      ? widget.result //  Show rsult full text
                      : '${widget.result.substring(0, 300)}${String.fromCharCode(8230)}',
                ),
                if (widget.result.length > 300)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        resultText = !resultText;
                      });
                    },
                    child: Text(
                      resultText ? 'Close' : 'Selengkapnya',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      //const Material(
      //   child: SingleChildScrollView(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //       child: Column(
      //         children: <Widget>[
      //           Text(
      //             'Dapatkan rekomendasi perjalanan mendaki Anda menggunakan fitur rekomendasi AI di bawah ini yaa : ',
      //             style: TextStyle(
      //               fontSize: 16,
      //             ),
      //             textAlign: TextAlign.center,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
