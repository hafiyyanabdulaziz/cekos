part of 'widgets.dart';

class MainPageRekomendasi extends StatefulWidget {
  @override
  _MainPageRekomendasiState createState() => _MainPageRekomendasiState();
}

class _MainPageRekomendasiState extends State<MainPageRekomendasi> {
  int limit = 5;
  //List<GetListProperti> dataProperti = new List();
  KoseekerModelMultiple koseekerModelMultiple = KoseekerModelMultiple();

  void getDataKoseekerMultiple() async {
    String parameter = '?limit=$limit';
    await KoseekerViewModel()
        .getDataKoseekerMultiple(parameter: parameter)
        .then((value) {
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
    return koseekerModelMultiple.data == null
        ? Center(child: CircularProgressIndicator())
        : Container(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PropertiDetailPage(
                                photo: koseekerModelMultiple.data[i].mainImage,
                                tipe: koseekerModelMultiple.data[i].type[0],
                                penghuni:
                                    koseekerModelMultiple.data[i].category[0],
                                harga: koseekerModelMultiple
                                    .data[i].roomType[0].price.yearly,
                                nama: koseekerModelMultiple.data[i].name,
                                id: koseekerModelMultiple.data[i].id,
                                gallery: koseekerModelMultiple.data[i].gallery,
                                village: koseekerModelMultiple
                                    .data[i].address.village,
                                district: koseekerModelMultiple
                                    .data[i].address.district,
                                city:
                                    koseekerModelMultiple.data[i].address.city,
                                province: koseekerModelMultiple
                                    .data[i].address.province,
                                facility:
                                    koseekerModelMultiple.data[i].facility,
                                environmentAccess: koseekerModelMultiple
                                    .data[i].environmentAccess,
                                parkingFacility: koseekerModelMultiple
                                    .data[i].parkingFacility,
                                category:
                                    koseekerModelMultiple.data[i].category,
                                description:
                                    koseekerModelMultiple.data[i].description,
                                lat: koseekerModelMultiple
                                    .data[i].address.location.coordinates[1],
                                lng: koseekerModelMultiple
                                    .data[i].address.location.coordinates[0],
                                rules: koseekerModelMultiple.data[i].rules,
                                roomType:
                                    koseekerModelMultiple.data[i].roomType,
                              );
                            },
                          ),
                        );
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
