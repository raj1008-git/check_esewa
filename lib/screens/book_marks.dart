import 'package:autumn/api/esewa_payment.dart';
import 'package:flutter/material.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialButton(
        // padding: EdgeInsets.only(left: ),
        onPressed: () {
          EsewaService().useEsewa();
        },
        color: Colors.green,
        child: const Text('E-Sewa'),
      ),
    );
  }
}
