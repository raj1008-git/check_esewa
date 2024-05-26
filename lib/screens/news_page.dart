import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/esewa_payment.dart';
import '../my_widgets/album_model.dart';
import '../my_widgets/information_model.dart';

class NewsPage extends StatelessWidget {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  NewsPage({
    required this.source,
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.url,
  });
  // const NewsPage({super.key, required this.source, this.author, required this.title, this.description, required this.url, this.urlToImage, required this.publishedAt, this.content});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(publishedAt);
    // News selectedNews = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Happy Reading',
              style: TextStyle(fontSize: 25),
            ),
            Icon(Icons.menu),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 250,
                  width: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(urlToImage!), fit: BoxFit.cover)),
                ),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ImageIcon(
                    //   selectedNews.profilePic,
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      author!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('•'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  content!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.only(top: 14, bottom: 14),
                  onPressed: () {
                    EsewaService().useEsewa();
                  },
                  color: Colors.green,
                  child: const Text(
                    '\$ Buy me a Coffee',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
