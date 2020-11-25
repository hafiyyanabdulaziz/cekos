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
              child: GestureDetector(
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
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: const Color(0xff23243b),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x80000000),
                        offset: Offset(4, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text(dataProperti[i].photo),
                      //FOTO
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.0),
                            topRight: Radius.circular(14.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(propertyID[i].photo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //TIPE
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        child: Text(
                          (propertyID[i].tipe + ' - ' + propertyID[i].penghuni),
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //NAMA
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          propertyID[i].nama,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 25,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          NumberFormat.currency(
                                locale: 'id',
                                decimalDigits: 0,
                                symbol: 'Rp ',
                              ).format(propertyID[i].harga) +
                              ' /Tahun',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.0),
                            topRight: Radius.circular(14.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(propertyID[i].nama),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
