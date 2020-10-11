part of 'pages.dart';

class ButtonNavigationBarPage extends StatefulWidget {
  @override
  _ButtonNavigationBarPageState createState() =>
      _ButtonNavigationBarPageState();
}

/* enum _SelectedTab {
  home,
  profile, /* search, profile */
} */

class _ButtonNavigationBarPageState extends State<ButtonNavigationBarPage> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    MainPage(),
    ExplorePage(),
    CrispChatPage(),
    ProfilePage(),

    /* Halamantiga(),
    Halamantiga(), */
  ];

  //var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      //_selectedTab = _SelectedTab.values[i];
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Color(0xff20233A),
        child: SalomonBottomBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xffAF8D19),
          currentIndex: _selectedIndex,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.beenhere),
              title: Text("Explore"),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.chat),
              title: Text("Chat"),
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
