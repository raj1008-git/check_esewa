import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/news_page.dart';
import 'album_model.dart';

class SliderContainer extends StatelessWidget {
  final String? author;
  final String title;
  final String? urlToImage;
  final DateTime publishedAt;
  final Source source;
  final String? description;
  final String url;
  final String? content;
  SliderContainer({
    required this.author,
    required this.publishedAt,
    required this.urlToImage,
    required this.title,
    required this.url,
    required this.content,
    required this.source,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(publishedAt);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => NewsPage(
              source: source,
              author: author,
              title: title,
              urlToImage: urlToImage,
              content: content,
              description: description,
              publishedAt: publishedAt,
              url: url,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: urlToImage != null
              ? DecorationImage(
                  image: NetworkImage(urlToImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              formattedDate,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            Text(
              author!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noto Serif',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
