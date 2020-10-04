import 'package:Cekos/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      title: 'Cekos',
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
