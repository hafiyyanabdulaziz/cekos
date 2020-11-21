part of 'pages.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<GetDetailProperti> propertyID = List();
  void getRecomendasi() async {
    GetRecomendasiList().getRecomendasi().then((value) {
      for (var item in value) {
        GetDetailProperti.connectToAPI(propertyID: item).then((value) => {
              setState(() {
                print('==============' + value.toString());
                propertyID.add(value);
              }),
            });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //getDataUser();
    getRecomendasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        title: Text('Explore'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchControlPage();
                  },
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Color(0xFF14172B),
      body: RekomendasiList(
        propertyID: propertyID,
      ),
    );
  }
}
