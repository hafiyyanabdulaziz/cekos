part of 'widgets.dart';

// ignore: must_be_immutable
class RekomendasiList extends StatefulWidget {
  List<GetDetailProperti> propertyID = List();

  RekomendasiList({@required this.propertyID});
  @override
  _RekomendasiListState createState() => _RekomendasiListState();
}

class _RekomendasiListState extends State<RekomendasiList> {
  //int page = 0;
  //List<GetListProperti> dataProperti = new List();
  //List<GetDetailProperti> propertyID = List();

  // void getDataUser() async {
  //   await GetListProperti.connectToAPI(
  //     name: widget.name,
  //     limit: 5,
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

  void getRecomendasi() async {
    GetRecomendasiList().getRecomendasi().then((value) {
      for (var item in value) {
        GetDetailProperti.connectToAPI(propertyID: item).then((value) => {
              setState(() {
                print('==============' + value.toString());
                widget.propertyID.add(value);
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
    return ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget.propertyID.length,
          itemBuilder: (context, i) {
            return TouchableOpacity(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PropertiDetailPage(
                          photo: widget.propertyID[i].photo,
                          tipe: widget.propertyID[i].tipe,
                          penghuni: widget.propertyID[i].penghuni,
                          harga: widget.propertyID[i].harga,
                          nama: widget.propertyID[i].nama,
                          id: widget.propertyID[i].id,
                          daerah: widget.propertyID[i].daerah,
                          gallery: widget.propertyID[i].gallery,
                          village: widget.propertyID[i].village,
                          district: widget.propertyID[i].district,
                          city: widget.propertyID[i].city,
                          province: widget.propertyID[i].province,
                          facility: widget.propertyID[i].facility,
                          environmentAccess:
                              widget.propertyID[i].environmentAccess,
                          parkingFacility: widget.propertyID[i].parkingFacility,
                          category: widget.propertyID[i].category,
                          description: widget.propertyID[i].description,
                          lat: widget.propertyID[i].lat,
                          lng: widget.propertyID[i].lng,
                          rules: widget.propertyID[i].rules,
                          roomType: widget.propertyID[i].roomType,
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
                            image: NetworkImage(widget.propertyID[i].photo),
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
                          (widget.propertyID[i].tipe +
                              ' - ' +
                              widget.propertyID[i].penghuni),
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
                          widget.propertyID[i].nama,
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
                              ).format(widget.propertyID[i].harga) +
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
                            image: NetworkImage(widget.propertyID[i].nama),
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