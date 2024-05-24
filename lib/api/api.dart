import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
//
// import '../my_widgets/album_model.dart';
//
// class Api {
//   Future<List<Article>?> fetchArticle() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'https://saurav.tech/NewsAPI/top-headlines/category/health/in.json'));
//       // print(response.body);
//       if (response.statusCode == 200) {
//         // Article.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//         List newsList = jsonDecode(response.body);
//         return newsList.map((e) => Article.fromJson(e)).toList();
//       } else {
//         throw Exception();
//       }
//     } catch (e) {
//       debugPrint('fetch album exeption $e');
//     }
//     return null;
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../my_widgets/album_model.dart';

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://saurav.tech/NewsAPI/top-headlines/category/health/in.json'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
