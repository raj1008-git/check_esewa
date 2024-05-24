import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_widgets/information_model.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    News selectedNews = ModalRoute.of(context)?.settings.arguments as News;
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
        padding: EdgeInsets.only(left: 10, right: 10),
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
                          image: selectedNews.newsImage, fit: BoxFit.cover)),
                ),
                SizedBox(height: 15),
                Text(
                  selectedNews.storyTitle,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageIcon(
                      selectedNews.profilePic,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      selectedNews.writerName,
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
                      selectedNews.date,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(selectedNews.story),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
