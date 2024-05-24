import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  // const NewsContainer({super.key});
  final String? author;
  final String? title;

  final String? uriToImage;

  const NewsContainer(
      {required this.title, required this.author, required this.uriToImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(9.0),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(uriToImage!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            author!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
