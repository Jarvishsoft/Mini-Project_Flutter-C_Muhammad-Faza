import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:hikeabis_app/ui/screens/book_home_page.dart';
import 'package:hikeabis_app/ui/screens/detail_berita.dart';
import 'package:http/http.dart' as http;

class WartaGunung extends StatefulWidget {
  const WartaGunung({super.key});

  @override
  State<WartaGunung> createState() => _WartaGunungState();
}

class _WartaGunungState extends State<WartaGunung> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  List _post = [];

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=fbcea4dbf5b4435fb4c8fc66227c7157'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _post = data['articles'];
        });
        // ignore: avoid_print
        print(response.body);
        // ignore: avoid_print
        print(_post);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Warta Semata',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            Get.offAll(const BookHomePage());
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: SizedBox(
                // color: Colors.grey,
                height: 100,
                width: 100,
                child: _post[index]['urlToImage'] != null
                    ? Image.network(
                        _post[index]['urlToImage'],
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : const Center(),
              ),
              title: Text(
                '${_post[index]['title']}',
                maxLines: 2,
              ),
              subtitle: Text(
                '${_post[index]['author']}',
                maxLines: 2,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => DetailBerita(
                      url: _post[index]['url'],
                      title: _post[index]['title'],
                      content: _post[index]['content'],
                      publishedAt: _post[index]['publishedAt'],
                      author: _post[index]['author'],
                      urlToImage: _post[index]['urlToImage'],
                    ),
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
