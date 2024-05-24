import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class News {
  String writerName;
  NetworkImage newsImage;
  String storyTitle;
  String category;
  NetworkImage profilePic;
  String date;
  String story;

  News(
      {required this.category,
      required this.profilePic,
      required this.newsImage,
      required this.storyTitle,
      required this.writerName,
      required this.date,
      required this.story});
}
