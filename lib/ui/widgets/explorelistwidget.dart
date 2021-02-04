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
  //int page = 0;
  //List<GetListProperti> dataProperti = new List();
  KoseekerModelMultiple koseekerModelMultiple = KoseekerModelMultiple();

  String checkName() {
    if (widget.name == '') {
      return '';
    } else {
      return '&name=' + widget.name;
    }
  }

  String parameter() {
    print('nama: ' + widget.name);
    print('tipe properti: ' + widget.typeProperty);
    print('durasi menginap: ' + widget.durasiMenginap);
    print('kategori: ' + widget.kategori);
    print('furniture: ' + widget.furniture);
    print('tempat parkir: ' + widget.tempatParkir);
    print('Total: ' +
        '?limit=30' +
        checkName() +
        widget.durasiMenginap +
        widget.kategori +
        widget.furniture +
        widget.tempatParkir);
    return '?limit=30' +
        checkName() +
        widget.durasiMenginap +
        widget.kategori +
        widget.furniture +
        widget.tempatParkir;
  }

  void getDataKoseekerMultiple() async {
    await KoseekerViewModel()
        .getDataKoseekerMultiple(parameter: parameter())
        .then((value) {
      setState(() {
        koseekerModelMultiple = value;
      });
    });
  }

  // void getDataUser() async {
  //   GetListProperti.connectToAPI(
  //     name: widget.name,
  //     limit: 30,
  //     offset: page,
  //     typeProperty: widget.typeProperty,
  //     durasiMenginap: widget.durasiMenginap,
  //     kategori: widget.kategori,
  //     furniture: widget.furniture,
  //     tempatParkir: widget.tempatParkir,
  //   ).then((value) {
  //     setState(() {
  //       dataProperti = value;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //getDataUser();
    getDataKoseekerMultiple();
    //parameter();
  }

  @override
  Widget build(BuildContext context) {
    return koseekerModelMultiple.data == null
        ? Center(
            child: CircularProgressIndicator(
                //backgroundColor: Colors.amber,
                ),
          )
        : (koseekerModelMultiple.data.isEmpty)
            ? Center(
                child: Text(
                  'Maaf yang Anca cari tidak ditemukan...',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : ListView(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: koseekerModelMultiple.data.length,
                      itemBuilder: (context, i) {
                        return TouchableOpacity(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return PropertiDetailPage(
                              //         photo: dataProperti[i].photo,
                              //         tipe: dataProperti[i].tipe,
                              //         penghuni: dataProperti[i].penghuni,
                              //         harga: dataProperti[i].harga,
                              //         nama: dataProperti[i].nama,
                              //         id: dataProperti[i].id,
                              //         daerah: dataProperti[i].daerah,
                              //         gallery: dataProperti[i].gallery,
                              //         village: dataProperti[i].village,
                              //         district: dataProperti[i].district,
                              //         city: dataProperti[i].city,
                              //         province: dataProperti[i].province,
                              //         facility: dataProperti[i].facility,
                              //         environmentAccess:
                              //             dataProperti[i].environmentAccess,
                              //         parkingFacility:
                              //             dataProperti[i].parkingFacility,
                              //         category: dataProperti[i].category,
                              //         description: dataProperti[i].description,
                              //         lat: dataProperti[i].lat,
                              //         lng: dataProperti[i].lng,
                              //         rules: dataProperti[i].rules,
                              //         roomType: dataProperti[i].roomType,
                              //       );
                              //     },
                              //   ),
                              // );
                            },
                            child: Card(
                              harga: koseekerModelMultiple
                                  .data[i].roomType[0].price.yearly,
                              nama: koseekerModelMultiple.data[i].name,
                              penghuni:
                                  koseekerModelMultiple.data[i].category[0],
                              photo: koseekerModelMultiple.data[i].mainImage,
                              type: koseekerModelMultiple.data[i].type[0],
                            ),
                          ),
                        );
                      }),
                ],
              );
  }
}
