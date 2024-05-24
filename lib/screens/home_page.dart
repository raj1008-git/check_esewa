import 'package:autumn/my_widgets/catetegoryItemTile.dart';
import 'package:autumn/screens/book_marks.dart';
import 'package:autumn/screens/profile_page.dart';

import '../api/api.dart';
import '../my_widgets/album_model.dart';
import '../my_widgets/category_items.dart';
import '../my_widgets/news_category.dart';
import '../my_widgets/news_container.dart';
import 'package:autumn/api/api.dart';
import 'package:autumn/my_widgets/album_model.dart';
import 'package:autumn/my_widgets/category_items.dart';
import 'package:autumn/my_widgets/dummy_constants.dart';
import 'package:autumn/my_widgets/news_category.dart';
import 'package:autumn/my_widgets/news_container.dart';
import 'package:autumn/screens/news_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      NewsMainPage(futureAlbum: futureAlbum),
      const BookMarks(),
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bookmarks',
            icon: Icon(
              Icons.bookmark_add_outlined,
              color: _selectedIndex == 1 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_outline_outlined,
              color: _selectedIndex == 2 ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'AUTUMN',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.notification_add_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.search,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
      body: screens[_selectedIndex],
    );
  }
}

class NewsMainPage extends StatelessWidget {
  const NewsMainPage({
    super.key,
    required this.futureAlbum,
  });

  final Future<Album> futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        CarouselSlider(
          items: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1675715924047-a9cf6c539d9b?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1486365227551-f3f90034a57c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 260,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            pauseAutoPlayOnTouch: true,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return NewsCategoryChip(
                    category: categoryList[index], onPress: () {});
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 20);
              },
              itemCount: categoryList.length,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
                return const Center(child: Text('No articles found'));
              } else {
                return ListView.separated(
                  itemCount: snapshot.data!.articles.length,
                  itemBuilder: (context, index) {
                    final article = snapshot.data!.articles[index];
                    return CategoryItemTile(
                        source: article.source,
                        author: article.author,
                        title: article.title,
                        urlToImage: article.urlToImage,
                        content: article.content,
                        description: article.description,
                        publishedAt: article.publishedAt,
                        url: article.url);
                    //   NewsContainer(
                    //   title: article.title,
                    //   author: article.author,
                    //   uriToImage: article.urlToImage,
                    // );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
