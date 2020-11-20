part of 'pages.dart';

class SurveyTab extends StatefulWidget {
  @override
  _SurveyTabState createState() => _SurveyTabState();
}

class _SurveyTabState extends State<SurveyTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
