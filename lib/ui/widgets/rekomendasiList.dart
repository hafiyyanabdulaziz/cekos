part of 'widgets.dart';

// ignore: must_be_immutable
class RekomendasiList extends StatefulWidget {
  //List<GetDetailProperti> propertyID = List();

  //RekomendasiList({@required this.propertyID});
  @override
  _RekomendasiListState createState() => _RekomendasiListState();
}

class _RekomendasiListState extends State<RekomendasiList> {
  //int page = 0;
  //List<GetListProperti> dataProperti = new List();
  List<GetDetailProperti> propertyID = List();

  // void getDataUser() async {
  //   await GetListProperti.connectToAPI(
  //     name: name,
  //     limit: 5,
  //     offset: page,
  //     typeProperty: typeProperty,
  //     durasiMenginap: durasiMenginap,
  //     kategori: kategori,
  //     furniture: furniture,
  //     tempatParkir: tempatParkir,
  //   ).then((value) {
  //     setState(() {
  //       dataProperti = value;
  //     });
  //   });
  // }

  Future<String> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_uid');
  }

  void getRecomendasi() async {
    getUserID().then((userID) {
      GetRecomendasiList().getRecomendasi(userID).then((value) {
        for (var item in value) {
          GetDetailProperti.connectToAPI(propertyID: item).then((value) => {
                setState(() {
                  print('==============' + value.toString());
                  propertyID.add(value);
                }),
              });
        }
      });
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
    return ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: propertyID.length,
          itemBuilder: (context, i) {
            return TouchableOpacity(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PropertiDetailPage(
                        photo: propertyID[i].photo,
                        tipe: propertyID[i].tipe,
                        penghuni: propertyID[i].penghuni,
                        harga: propertyID[i].harga,
                        nama: propertyID[i].nama,
                        id: propertyID[i].id,
                        daerah: propertyID[i].daerah,
                        gallery: propertyID[i].gallery,
                        village: propertyID[i].village,
                        district: propertyID[i].district,
                        city: propertyID[i].city,
                        province: propertyID[i].province,
                        facility: propertyID[i].facility,
                        environmentAccess: propertyID[i].environmentAccess,
                        parkingFacility: propertyID[i].parkingFacility,
                        category: propertyID[i].category,
                        description: propertyID[i].description,
                        lat: propertyID[i].lat,
                        lng: propertyID[i].lng,
                        rules: propertyID[i].rules,
                        roomType: propertyID[i].roomType,
                      );
                    },
                  ),
                );
              },
              child: Card(
                harga: propertyID[i].harga,
                nama: propertyID[i].nama,
                penghuni: propertyID[i].penghuni,
                photo: propertyID[i].photo,
                type: propertyID[i].tipe,
              ),
            );
          },
        ),
      ],
    );
  }
}
