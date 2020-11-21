part of 'widgets.dart';

// ignore: must_be_immutable
class ExploreListWidget extends StatefulWidget {
  String name;
  String typeProperty;
  String durasiMenginap;
  String kategori;
  String furniture;
  String tempatParkir;

  ExploreListWidget({
    this.name = '',
    this.typeProperty = '',
    this.durasiMenginap = '',
    this.kategori = '',
    this.furniture = '',
    this.tempatParkir = '',
  });

  @override
  _ExploreListWidgetState createState() => _ExploreListWidgetState();
}

class _ExploreListWidgetState extends State<ExploreListWidget> {
  int page = 0;
  List<GetListProperti> dataProperti = new List();
  List<GetDetailProperti> propertyID = List();

  void getDataUser() async {
    await GetListProperti.connectToAPI(
      name: widget.name,
      limit: 5,
      offset: page,
      typeProperty: widget.typeProperty,
      durasiMenginap: widget.durasiMenginap,
      kategori: widget.kategori,
      furniture: widget.furniture,
      tempatParkir: widget.tempatParkir,
    ).then((value) {
      setState(() {
        dataProperti = value;
      });
    });
  }

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
    return dataProperti == null
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ),
          )
        : ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: propertyID.length,
                itemBuilder: (context, i) {
                  return Text(
                    propertyID[i].name + i.toString(),
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  );
                },
              ),
            ],
          );
  }
}
