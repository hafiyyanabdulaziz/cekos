part of 'pages.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        title: Text('Explore'),
      ),
      backgroundColor: Color(0xFF14172B),
      body: ExploreListWidget(),
    );
  }
}
