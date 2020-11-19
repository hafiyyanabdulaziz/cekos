import 'package:Cekos/ui/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        unselectedWidgetColor: Colors.white,
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
