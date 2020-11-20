part of 'pages.dart';

class BookingTabs extends StatefulWidget {
  @override
  _BookingTabsState createState() => _BookingTabsState();
}

class _BookingTabsState extends State<BookingTabs> {
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
