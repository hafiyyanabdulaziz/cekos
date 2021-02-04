part of 'widgets.dart';

class MainPageRekomendasi extends StatefulWidget {
  @override
  _MainPageRekomendasiState createState() => _MainPageRekomendasiState();
}

class _MainPageRekomendasiState extends State<MainPageRekomendasi> {
  int offset = 0;
  int limit = 5;
  //List<GetListProperti> dataProperti = new List();
  KoseekerModelMultiple koseekerModelMultiple = KoseekerModelMultiple();

  void getDataKoseekerMultiple() async {
    await KoseekerViewModel().getDataKoseekerMultiple().then((value) {
      setState(() {
        koseekerModelMultiple = value;
      });
    });
  }

  // void getDataUser() async {
  //   await GetListProperti.connectToAPI(
  //     limit: limit,
  //     offset: offset,
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
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
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 10,
                    //bottom: 10,
                    //top: 10,
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
                        height: 140,
                        width: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.0),
                            topRight: Radius.circular(14.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                koseekerModelMultiple.data[i].mainImage),
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
                          (koseekerModelMultiple.data[i].type[0] +
                              ' - ' +
                              koseekerModelMultiple.data[i].category[0]),
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //NAMA
                      Container(
                        width: 100,
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          koseekerModelMultiple.data[i].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 14,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //HARGA
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
                              ).format(koseekerModelMultiple
                                  .data[i].roomType[0].price.yearly) +
                              ' /Tahun',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );

    /* ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        ListView.builder(
            itemCount: dataProperti.length,
            itemBuilder: (context, i) {
              return Text(dataProperti[i].id);
            }),
      ],
    ); */
  }
}
