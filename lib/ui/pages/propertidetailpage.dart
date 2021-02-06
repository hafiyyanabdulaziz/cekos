part of 'pages.dart';

// ignore: must_be_immutable
class PropertiDetailPage extends StatefulWidget {
  KoseekerModelSingle koseekerModelSingle = KoseekerModelSingle();
  // String photo =
  //     "https://1.bp.blogspot.com/-fcqYJ8sOUtw/X0zEQsZWkVI/AAAAAAAAI24/hAq1jqHHAhYIZoRqkSsdlh3QBBfYcYAwgCLcBGAsYHQ/s1600/fiksioner-no-image.png";
  // String tipe;
  // String penghuni;
  // int harga;
  // String nama;
  // String id;
  // List<String> gallery;

  // String village;
  // String district;
  // String city;
  // String province;
  // List<String> facility;
  // List<String> environmentAccess;
  // List<String> parkingFacility;
  // List<String> category;
  // String description;
  // List<String> rules;
  // List<RoomType> roomType;

  // double lat;
  // double lng;
  //GetListProperti getProperti;

  PropertiDetailPage({
    @required this.koseekerModelSingle,
    // @required this.photo,
    // @required this.tipe,
    // @required this.penghuni,
    // @required this.harga,
    // @required this.nama,
    // @required this.id,
    // @required this.gallery,
    // @required this.village,
    // @required this.district,
    // @required this.city,
    // @required this.province,
    // @required this.facility,
    // @required this.environmentAccess,
    // @required this.parkingFacility,
    // @required this.category,
    // @required this.description,
    // @required this.lat,
    // @required this.lng,
    // @required this.rules,
    // @required this.roomType,
  });

  @override
  _PropertiDetailPageState createState() => _PropertiDetailPageState();
}

class _PropertiDetailPageState extends State<PropertiDetailPage> {
  Future<String> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_uid');
  }

  Future checkLikes(String propertyID) async {
    String userID = await getUserID();
    bool ada;

    await http.post('https://hafiyyanabdulaziz.pythonanywhere.com/post/',
        body:
            '{"user_id": "$userID", "property_id": "${widget.koseekerModelSingle.data.id}", "ratings": 1}');

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentSnapshot snapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('likes')
        .doc(widget.koseekerModelSingle.data.id)
        .get();

    if (snapshot.exists) {
      ada = true;
    } else {
      ada = false;
    }

    return ada;
  }

  bool checkIcon = false;

  @override
  void initState() {
    // getUserID().then((value) {
    //   PostRekomendasi.connectToAPI(value, 'asd').then((value) {
    //     print('Hafiyyan' + value.userID);
    //     setState(() {});
    //   });
    // });
    checkLikes(widget.koseekerModelSingle.data.id).then((value) {
      setState(() {
        checkIcon = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      appBar: AppBar(
        title: Text('CEKOS'),
        centerTitle: true,
        backgroundColor: Color(0xFF23243B),
        actions: [
          IconButton(
            icon: (checkIcon)
                ? Icon(
                    Icons.favorite,
                    color: Color(0xffaf8d19),
                  )
                : Icon(Icons.favorite_border),
            onPressed: () {
              if (!checkIcon) {
                {
                  Future<String> getUserID() async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    return sharedPreferences.getString('user_uid');
                  }

                  getUserID().then((userID) async {
                    await http.post(
                        'https://hafiyyanabdulaziz.pythonanywhere.com/post/',
                        body:
                            '{"user_id": "$userID", "property_id": "${widget.koseekerModelSingle.data.id}", "ratings": 2}');
                    print('halo' + userID);
                    DatabaseFirestore.createOrUpdateLikes(
                        userID: userID,
                        propertyID: widget.koseekerModelSingle.data.id,
                        propertyName: widget.koseekerModelSingle.data.name,
                        propertyPhotoURL:
                            widget.koseekerModelSingle.data.mainImage);
                    print('halo' + userID);
                  });
                }
              } else {
                Future<String> getUserID() async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  return sharedPreferences.getString('user_uid');
                }

                getUserID().then((userID) {
                  print('halo' + userID);
                  DatabaseFirestore.deleteLikes(
                      userID: userID,
                      propertyID: widget.koseekerModelSingle.data.id);
                  print('halo' + userID);
                });
              }
              checkIcon = !checkIcon;
              setState(() {});
              checkLikes(widget.koseekerModelSingle.data.id).then((value) {
                print(value);
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          //FOTO
          DetailPageSlider(
            dataPhotos: widget.koseekerModelSingle.data.gallery,
          ),
          //HEADER
          Container(
            padding: EdgeInsets.all(15),
            color: Color(0xFF23243B),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TIPE
                Text(
                  (widget.koseekerModelSingle.data.type[0].capitalize() +
                      ' - ' +
                      ConvertText.convertToPenghuni(
                          widget.koseekerModelSingle)),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                //NAME
                Text(
                  widget.koseekerModelSingle.data.name,
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
                SizedBox(
                  height: 10,
                ),
                //DAERAH
                Text(
                  (widget.koseekerModelSingle.data.address.village != '' &&
                          widget.koseekerModelSingle.data.address.city != '')
                      ? widget.koseekerModelSingle.data.address.village +
                          ' - ' +
                          widget.koseekerModelSingle.data.address.city
                      : 'Indonesia',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),

          //ABOUT
          Container(
            color: Color(0xFF23243B),
            margin: EdgeInsets.only(
              top: 10,
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  deskripsi(),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),

          //FASILITAS
          (widget.koseekerModelSingle.data.facility.isEmpty)
              ? Container()
              : Container(
                  color: Color(0xFF23243B),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title fasilitas
                      Text(
                        'Fasilitas',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListBody(
                          children: ConvertText.facilityConvert(
                                  widget.koseekerModelSingle)
                              .map((e) => Text(
                                    '- ' + e,
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ))
                              .toList()),
                    ],
                  ),
                ),

          //HALAMAN PARKIR
          (widget.koseekerModelSingle.data.parkingFacility.isEmpty)
              ? Container()
              : Container(
                  color: Color(0xFF23243B),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title fasilitas
                      Text(
                        'Halaman Parkir',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListBody(
                          children: ConvertText.parkingFacilityConvert(
                                  widget.koseekerModelSingle)
                              .map((e) => Text(
                                    '- ' + e,
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ))
                              .toList()),
                    ],
                  ),
                ),

          //AKSES lINGKUNGAN
          (widget.koseekerModelSingle.data.environmentAccess.isEmpty)
              ? Container()
              : Container(
                  color: Color(0xFF23243B),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title fasilitas
                      Text(
                        'Akses Lingkungan',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListBody(
                          children: ConvertText.environmentAccessConvert(
                                  widget.koseekerModelSingle)
                              .map((e) => Text(
                                    '- ' + e,
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ))
                              .toList()),
                    ],
                  ),
                ),

          //PENGHUNI
          (widget.koseekerModelSingle.data.category.isEmpty)
              ? Container()
              : Container(
                  color: Color(0xFF23243B),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title fasilitas
                      Text(
                        'Penghuni',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListBody(
                          children: ConvertText.categoryConvert(
                                  widget.koseekerModelSingle)
                              .map((e) => Text(
                                    '- ' + e,
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ))
                              .toList()),
                    ],
                  ),
                ),

          //PERATURAN
          (widget.koseekerModelSingle.data.rules.isEmpty)
              ? Container()
              : Container(
                  color: Color(0xFF23243B),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title fasilitas
                      Text(
                        'Peraturan',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListBody(
                          children: ConvertText.rulesConvert(
                                  widget.koseekerModelSingle)
                              .map((e) => Text(
                                    '- ' + e,
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ))
                              .toList()),
                    ],
                  ),
                ),

          //LOKASI
          Container(
            color: Color(0xFF23243B),
            margin: EdgeInsets.only(
              top: 10,
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title fasilitas
                Text(
                  'Lokasi',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                TouchableOpacity(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Lokasi(
                              lat: widget.koseekerModelSingle.data.address
                                  .location.coordinates[1],
                              lng: widget.koseekerModelSingle.data.address
                                  .location.coordinates[0],
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff23243b),
                        image: DecorationImage(
                          // NetworkImage(
                          //     'https://static.vecteezy.com/ti/vettori-gratis/p1/151264-vettore-di-mappa-della-citta-vettoriale.png'),
                          image: AssetImage(
                              'lib/assets/images/maps/mapsIlustration.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Center(
                        child: Text(
                          'Ketuk untuk melihat lokasi',
                          style: TextStyle(
                            color: Color(0xFF14172B),
                            fontFamily: 'rubik',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //TIPE KAMAR
          Container(
            color: Color(0xFF23243B),
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title fasilitas
                Text(
                  'Tipe Kamar',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                ListBody(
                    children: widget.koseekerModelSingle.data.roomType
                        .map((e) => Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF50E3C2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (e.name == '') ? 'Tipe Idaman' : e.name,
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 20,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Divider(
                                    color: Color(0xFF50E3C2),
                                  ),
                                  Text(
                                    'Ukuran kamar ${e.roomSize} meter, ${(e.isBathRoomInside) ? "Kamar mandi di dalam" : "Kamar mandi di luar"}, Maksimal ${e.maxGuess} Orang/kamar, ${(e.isFurnished) ? "Sudah ada kasur dan perabotan" : "Belum ada kasur dan perabotan"}.',
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  (e.facility.isEmpty)
                                      ? Container()
                                      : Divider(
                                          color: Color(0xFF50E3C2),
                                        ),
                                  (e.facility.isEmpty)
                                      ? Container()
                                      : Text(
                                          'Fasilitas Kamar',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            fontSize: 17,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                  ListBody(
                                      children: ConvertText.roomFacilityConvert(
                                              e.facility)
                                          .map<Widget>((e) => Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Text(
                                                  '- ' + e,
                                                  style: TextStyle(
                                                    fontFamily: 'Rubik',
                                                    fontSize: 15,
                                                    color:
                                                        const Color(0xffffffff),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ))
                                          .toList()),
                                  (e.price.yearly == 0)
                                      ? Container()
                                      : Divider(
                                          color: Color(0xFF50E3C2),
                                        ),
                                  (e.price.yearly == 0)
                                      ? Container()
                                      : Text(
                                          'Harga',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            fontSize: 17,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                  (e.price.yearly == 0)
                                      ? Container()
                                      : Text(
                                          NumberFormat.currency(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: 'Rp ',
                                              ).format(e.price.yearly) +
                                              ' /Tahun',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                  (e.price.monthly == 0)
                                      ? Container()
                                      : Text(
                                          NumberFormat.currency(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: 'Rp ',
                                              ).format(e.price.monthly) +
                                              ' /Bulan',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                  (e.price.weekly == 0)
                                      ? Container()
                                      : Text(
                                          NumberFormat.currency(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: 'Rp ',
                                              ).format(e.price.weekly) +
                                              ' /Pekan',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                  (e.price.daily == 0)
                                      ? Container()
                                      : Text(
                                          NumberFormat.currency(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: 'Rp ',
                                              ).format(e.price.daily) +
                                              ' /Hari',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                ],
                              ),
                            ))
                        .toList()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: (widget
                  .koseekerModelSingle.data.roomType[0].price.yearly ==
              0)
          ? Container(
              height: 0,
            )
          : Container(
              //height: 0,
              decoration: BoxDecoration(
                color: Color(0xFF23243B),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.5), //(x,y)
                    blurRadius: 4.0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TouchableOpacity(
                      child: GestureDetector(
                        onTap: () async {
                          String userID = await getUserID();

                          await http.post(
                              'https://hafiyyanabdulaziz.pythonanywhere.com/post/',
                              body:
                                  '{"user_id": "$userID", "property_id": "${widget.koseekerModelSingle.data.id}", "ratings": 3}');

                          showBarModalBottomSheet(
                            context: context,
                            expand: true,
                            builder: (context) => Survey(
                              idProperty: widget.koseekerModelSingle.data.id,
                              namaProperty:
                                  widget.koseekerModelSingle.data.name,
                              photoPropety:
                                  widget.koseekerModelSingle.data.mainImage,
                            ),
                          );
                        },
                        child: Text(
                          'Survey dulu',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 17,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Color(0xffaf8d19),
                      onPressed: () async {
                        String userID = await getUserID();

                        await http.post(
                            'https://hafiyyanabdulaziz.pythonanywhere.com/post/',
                            body:
                                '{"user_id": "$userID", "property_id": "${widget.koseekerModelSingle.data.id}", "ratings": 4}');

                        showBarModalBottomSheet(
                          context: context,
                          expand: true,
                          builder: (context) => Booking(
                            data: widget.koseekerModelSingle.data.roomType,
                            propertyName: widget.koseekerModelSingle.data.name,
                            propertyID: widget.koseekerModelSingle.data.id,
                            propertyPhoto:
                                widget.koseekerModelSingle.data.mainImage,
                          ),
                        );
                      },
                      child: Text(
                        'Booking',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  String deskripsi() {
    return widget.koseekerModelSingle.data.name +
        'yang terletak di ' +
        widget.koseekerModelSingle.data.address.village +
        ', ' +
        widget.koseekerModelSingle.data.address.district +
        ', ' +
        widget.koseekerModelSingle.data.address.city +
        ', ' +
        widget.koseekerModelSingle.data.address.province +
        ' merupakan hunian yang nyaman untuk ditempati. ' +
        'Lokasinya pun strategis  dan memiliki banyak fasilitas. Harganya pun terjangkau. ' +
        widget.koseekerModelSingle.data.description;
  }

  // Widget ifEmpty(String text) {
  //   return Text(
  //     text,
  //     style: TextStyle(
  //       fontFamily: 'Rubik',
  //       fontSize: 15,
  //       color: const Color(0xffffffff),
  //       fontWeight: FontWeight.w500,
  //     ),
  //     textAlign: TextAlign.left,
  //   );
  // }
}
