part of 'pages.dart';

// ignore: must_be_immutable
class PropertiDetailPage extends StatefulWidget {
  @override
  _PropertiDetailPageState createState() => _PropertiDetailPageState();
}

class _PropertiDetailPageState extends State<PropertiDetailPage> {
  GetDetailProperti getDetailProperti;

  void init() {
    GetDetailProperti.connectToAPI();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Color(0xFF23243B),
      ),
      body: ListView(
        children: [
          Text(
            (getDetailProperti != null) ? getDetailProperti.name : "halo",
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 30,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: const Color(0xff000000),
                  offset: Offset(4, 4),
                  blurRadius: 8,
                )
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
