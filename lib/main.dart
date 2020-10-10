import 'package:Cekos/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    /* SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    )); */

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Rubik',
        /* primarySwatch: Colors.black45,
        canvasColor: Color(0xFF14172B), */
      ),
      title: 'Cekos',
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
