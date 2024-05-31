import 'package:autumn/my_widgets/catetegoryItemTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/book_mark_provider.dart';
// import 'category_item_tile.dart'; // Import your CategoryItemTile
// import 'bookmark_model.dart'; // Import your BookmarkModel

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkModel>(
      builder: (context, bookmarkModel, child) {
        final data = bookmarkModel.bookmarkedItems;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return CategoryItemTile(
              article: data[index],
              isBookmarked: data.contains(data[index]),
              onPressed: () {},
            );
          },
        );
      },
    );
  }
}
