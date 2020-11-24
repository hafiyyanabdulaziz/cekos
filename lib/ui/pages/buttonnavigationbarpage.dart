part of 'pages.dart';

// ignore: must_be_immutable
class ButtonNavigationBarPage extends StatefulWidget {
  int selectedIndex;
  ButtonNavigationBarPage({this.selectedIndex = 0});
  @override
  _ButtonNavigationBarPageState createState() =>
      _ButtonNavigationBarPageState();
}

/* enum _SelectedTab {
  home,
  profile, /* search, profile */
} */

class _ButtonNavigationBarPageState extends State<ButtonNavigationBarPage> {
  final _widgetOptions = [
    MainPage(),
    ExplorePage(),
    Favorite(),
    //CrispChatPage(),
    ProfilePage(),
    //Coba(),
    /* Halamantiga(),
    Halamantiga(), */
  ];

  //var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      //_selectedTab = _SelectedTab.values[i];
      widget.selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      body: _widgetOptions.elementAt(widget.selectedIndex),
      bottomNavigationBar: Container(
        color: Color(0xff20233A),
        child: SalomonBottomBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xffAF8D19),
          currentIndex: widget.selectedIndex,
          onTap: _handleIndexChanged,
          /* (int i) {
            setState(() {
              widget.selectedIndex = i;
            });
          }, */
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
              icon: Icon(Icons.favorite),
              title: Text("Favorite"),
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
