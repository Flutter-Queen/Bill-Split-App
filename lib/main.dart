import 'package:bill_split_app/Screens/homeview.dart';
import 'package:bill_split_app/Screens/splash.dart';
import 'package:flutter/material.dart';

import 'Screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BILL SPLIT APP',
      debugShowCheckedModeBanner: false,
      home: BillSplit(),
    );
  }
}
