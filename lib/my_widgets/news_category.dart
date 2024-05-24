import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCategoryChip extends StatelessWidget {
  final String category;
  final VoidCallback? onPress;
  NewsCategoryChip({required this.category, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: Colors.green,
      child: Text(
        category,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
