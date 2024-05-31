import 'dart:convert';

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
