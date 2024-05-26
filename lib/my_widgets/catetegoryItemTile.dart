import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'album_model.dart';
import 'information_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package

import 'album_model.dart';

class CategoryItemTile extends StatefulWidget {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  CategoryItemTile({
    required this.source,
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.url,
  });

  @override
  State<CategoryItemTile> createState() => _CategoryItemTileState();
}

class _CategoryItemTileState extends State<CategoryItemTile> {
  bool _isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    // Format the DateTime object to a string
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(widget.publishedAt);

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
                image: widget.urlToImage != null
                    ? DecorationImage(
                        image: NetworkImage(widget.urlToImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: widget.urlToImage == null ? Colors.grey : null,
              ),
              child: widget.urlToImage == null
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
                      if (widget.author != null)
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.author!,
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
                    widget.title,
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
                  onPressed: () {
                    setState(() {
                      _isBookmarked = !_isBookmarked;
                    });
                  },
                  icon: Icon(
                    _isBookmarked
                        ? Icons.bookmark_add_outlined
                        : Icons.bookmark_border,
                    color: _isBookmarked ? Colors.green : Colors.grey,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
