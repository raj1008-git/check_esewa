import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/book_mark_provider.dart';
import 'album_model.dart';
// import 'bookmark_model.dart'; // Import your BookmarkModel

class CategoryItemTile extends StatelessWidget {
  final Article article;
  final VoidCallback onPressed;

  final bool? isBookmarked;

  CategoryItemTile({
    required this.article,
    this.isBookmarked = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(article.publishedAt);
    // Check if current tile is bookmarked

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: article.urlToImage != null
                    ? DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: article.urlToImage == null ? Colors.grey : null,
              ),
              child: article.urlToImage == null
                  ? Icon(Icons.image, size: 50, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (article.author != null)
                        SizedBox(
                          width: 200,
                          child: Text(
                            article.author!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Noto Serif',
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  isBookmarked!
                      ? Icons.bookmark_add_outlined
                      : Icons.bookmark_border,
                  color: isBookmarked! ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
