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
  //List<GetDetailProperti> propertyID = List();
  List<KoseekerModelSingle> listKoseekerModelSingle = List();
  List<Map> coba = [];

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

  void getRecomendasi() {
    getUserID().then((userID) {
      GetRecomendasiList().getRecomendasi(userID).then((value) {
        print('SEBELUM PENGULANGAN');
        int i = 0;
        for (var item in value) {
          KoseekerViewModel().getDataKoseekerSingle(propertyID: item).then(
                (value) => {
                  print('Ini Hasil value: ' + value.toString()),
                  if (value != null)
                    {
                      setState(() {
                        print('Hasil ==============' + value.toString());
                        listKoseekerModelSingle.add(value);
                        print('ini panjang listmodel: ' +
                            listKoseekerModelSingle.length.toString());
                        print('Ini ID dari python: ' + item);
                        print('Ini ID dari Koseeker: ' +
                            listKoseekerModelSingle[i].data.id);
                        i++;
                      }),
                    }
                  else
                    {
                      print('Tidak ada hasil'),
                    },
                },
              );
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
          itemCount: listKoseekerModelSingle.length,
          itemBuilder: (context, i) {
            return TouchableOpacity(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PropertiDetailPage(
                        photo: listKoseekerModelSingle[i].data.mainImage,
                        tipe: listKoseekerModelSingle[i].data.type[0],
                        penghuni: listKoseekerModelSingle[i].data.category[0],
                        harga: listKoseekerModelSingle[i]
                            .data
                            .roomType[0]
                            .price
                            .yearly,
                        nama: listKoseekerModelSingle[i].data.name,
                        id: listKoseekerModelSingle[i].data.id,
                        daerah: 'xxxDAERAHxxx',
                        gallery: listKoseekerModelSingle[i].data.gallery,
                        village:
                            listKoseekerModelSingle[i].data.address.village,
                        district:
                            listKoseekerModelSingle[i].data.address.district,
                        city: listKoseekerModelSingle[i].data.address.city,
                        province:
                            listKoseekerModelSingle[i].data.address.province,
                        facility: listKoseekerModelSingle[i].data.facility,
                        environmentAccess:
                            listKoseekerModelSingle[i].data.environmentAccess,
                        parkingFacility:
                            listKoseekerModelSingle[i].data.parkingFacility,
                        category: listKoseekerModelSingle[i].data.category,
                        description:
                            listKoseekerModelSingle[i].data.description,
                        lat: listKoseekerModelSingle[i]
                            .data
                            .address
                            .location
                            .coordinates[1],
                        lng: listKoseekerModelSingle[i]
                            .data
                            .address
                            .location
                            .coordinates[0],
                        rules: listKoseekerModelSingle[i].data.rules,
                        roomType: listKoseekerModelSingle[i].data.roomType,
                      );
                    },
                  ),
                );
              },
              child: Card(
                harga: listKoseekerModelSingle[i].data.roomType[0].price.yearly,
                nama: listKoseekerModelSingle[i].data.name,
                penghuni: listKoseekerModelSingle[i].data.category[0],
                photo: listKoseekerModelSingle[i].data.mainImage,
                type: listKoseekerModelSingle[i].data.type[0],
              ),
            );
          },
        ),
      ],
    );
  }
}
