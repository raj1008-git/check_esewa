import 'package:autumn/api/esewa_payment.dart';
import 'package:flutter/material.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialButton(
        onPressed: () {
          EsewaService().useEsewa();
        },
        color: Colors.green,
        child: Text('E-Sewa'),
      ),
    );
  }
}