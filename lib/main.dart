import 'package:Cekos/ui/widgets/widgets.dart';
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
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
