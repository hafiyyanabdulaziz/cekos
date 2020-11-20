part of 'pages.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF23243B),
          title: Text('Favorite'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Likes",
              ),
              Tab(
                text: "Survey",
              ),
              Tab(
                text: "Booking",
              ),
            ],
            indicatorColor: Color(0xffaf8d19),
            labelColor: Color(0xffaf8d19),
            unselectedLabelColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          ProfilePage(),
          ProfilePage(),
          ProfilePage(),
        ]),
      ),
    );
  }
}
