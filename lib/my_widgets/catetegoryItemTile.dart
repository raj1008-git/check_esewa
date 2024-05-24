import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'album_model.dart';
import 'information_model.dart';

// class CategoryItemTile extends StatelessWidget {
//   Source source;
//   String? author;
//   String title;
//   String? description;
//   String url;
//   String? urlToImage;
//   DateTime publishedAt;
//   String? content;
//
//   CategoryItemTile(
//       {required this.source,
//       required this.author,
//       required this.title,
//       required this.urlToImage,
//       required this.content,
//       required this.description,
//       required this.publishedAt,
//       required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               height: 100,
//               width: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                     image: NetworkImage(urlToImage!), fit: BoxFit.cover),
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             flex: 3,
//             child: Container(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       // ImageIcon(informationModel.profilePic),
//                       Text(author!),
//                     ],
//                   ),
//                   Text(
//                     title,
//                   ),
//                   Text(publishedAt),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//               child: Center(
//                 child: Icon(Icons.bookmark_add_outlined),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package

import 'album_model.dart';

class CategoryItemTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // Format the DateTime object to a string
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(publishedAt);

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: urlToImage != null
                    ? DecorationImage(
                        image: NetworkImage(urlToImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: urlToImage == null ? Colors.grey : null,
              ),
              child: urlToImage == null
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
                      if (author != null)
                        SizedBox(
                          width: 200,
                          child: Text(
                            author!,
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
                    title,
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
            child: Container(
              child: Center(
                child: Icon(Icons.bookmark_add_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
