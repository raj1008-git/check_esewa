import 'package:autumn/my_widgets/album_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../my_widgets/catetegoryItemTile.dart';

class BookmarkModel extends ChangeNotifier {
  List<Article> bookmarkedItems = [];

  // List<CategoryItemTile> get bookmarkedItems => _bookmarkedItems;

  // Method to check if an item is bookmarked
  // bool isBookmarked(CategoryItemTile item) {
  //   final data = _bookmarkedItems.contains(item);
  //   notifyListeners();
  //   return data;
  // }

  // Method to toggle bookmark status
  void toggleBookmark(Article item) {
    if (bookmarkedItems.contains(item)) {
      bookmarkedItems.remove(item);
    } else {
      bookmarkedItems.add(item);
    }
    print(bookmarkedItems);
    notifyListeners();
  }
}
