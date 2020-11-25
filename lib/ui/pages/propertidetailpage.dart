part of 'pages.dart';

// ignore: must_be_immutable
class PropertiDetailPage extends StatefulWidget {
  String photo =
      "https://1.bp.blogspot.com/-fcqYJ8sOUtw/X0zEQsZWkVI/AAAAAAAAI24/hAq1jqHHAhYIZoRqkSsdlh3QBBfYcYAwgCLcBGAsYHQ/s1600/fiksioner-no-image.png";
  String tipe;
  String penghuni;
  int harga;
  String nama;
  String id;
  String daerah;
  List<String> gallery;

  String village;
  String district;
  String city;
  String province;
  List<String> facility;
  List<String> environmentAccess;
  List<String> parkingFacility;
  List<String> category;
  String description;
  List<String> rules;
  List<Map> roomType;

  double lat;
  double lng;
  //GetListProperti getProperti;

  PropertiDetailPage({
    @required this.photo,
    @required this.tipe,
    @required this.penghuni,
    @required this.harga,
    @required this.nama,
    @required this.id,
    @required this.daerah,
    @required this.gallery,
    @required this.village,
    @required this.district,
    @required this.city,
    @required this.province,
    @required this.facility,
    @required this.environmentAccess,
    @required this.parkingFacility,
    @required this.category,
    @required this.description,
    @required this.lat,
    @required this.lng,
    @required this.rules,
    @required this.roomType,
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
            '{"user_id": "$userID", "property_id": "${widget.id}", "ratings": 1}');

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentSnapshot snapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('likes')
        .doc(widget.id)
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
    checkLikes(widget.id).then((value) {
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

                  getUserID().then((userID) {
                    print('halo' + userID);
                    DatabaseFirestore.createOrUpdateLikes(
                        userID: userID,
                        propertyID: widget.id,
                        propertyName: widget.nama,
                        propertyPhotoURL: widget.photo);
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
                      userID: userID, propertyID: widget.id);
                  print('halo' + userID);
                });
              }
              checkIcon = !checkIcon;
              setState(() {});
              checkLikes(widget.id).then((value) {
                print(value);
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          DetailPageSlider(
            dataPhotos: widget.gallery,
          ),
          //TIPE
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Text(
              (widget.tipe + ' - ' + widget.penghuni),
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 15,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //NAME
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Text(
              widget.nama,
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
          ),
          //DAERAH
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Text(
              widget.daerah,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //ABOUT
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: Text(
              deskripsi(),
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 15,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //FASILITAS
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              'Fasilitas',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ListBody(
              children: facilityConvert()
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '- ' + e,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ))
                  .toList()),
          //HALAMAN PARKIR
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              'Halaman Parkir',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ListBody(
              children: parkingFacilityConvert()
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '- ' + e,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ))
                  .toList()),
          //AKSES LINGKUNGAN
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              'Akses Lingkungan',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ListBody(
              children: environmentAccessConvert()
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '- ' + e,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ))
                  .toList()),
          //PENGHUNI
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              'Penghuni',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ListBody(
              children: categoryConvert()
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '- ' + e,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ))
                  .toList()),
          //LOKASI
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              'Lokasi',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          TouchableOpacity(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Lokasi(
                        lat: widget.lat,
                        lng: widget.lng,
                      );
                    },
                  ),
                );
              },
              child: Container(
                //color: Colors.amber,
                // child: TouchableOpacity(

                //     // child: GoogleMap(
                //     //   mapType: MapType.normal,
                //     //   initialCameraPosition: CameraPosition(
                //     //     target: LatLng(getProperti.lat, getProperti.lng),
                //     //     zoom: 14.0,
                //     //   ),
                //     //   markers: {
                //     //     Marker(
                //     //       markerId: MarkerId("1"),
                //     //       position: LatLng(getProperti.lat, getProperti.lng),
                //     //       icon: BitmapDescriptor.defaultMarker,
                //     //     )
                //     //   },
                //     //   zoomControlsEnabled: false,
                //     //   zoomGesturesEnabled: false,
                //     //   scrollGesturesEnabled: false,
                //     //   mapToolbarEnabled: false,
                //     //   onTap: (argument) {
                //     //     Navigator.push(
                //     //       context,
                //     //       MaterialPageRoute(
                //     //         builder: (context) {
                //     //           return Lokasi(
                //     //             lat: getProperti.lat,
                //     //             lng: getProperti.lng,
                //     //           );
                //     //         },
                //     //       ),
                //     //     );
                //     //   },
                //     // ),
                //     ),
                decoration: BoxDecoration(
                  color: Color(0xff23243b),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: (MediaQuery.of(context).size.width - 20) / 2,
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Center(
                  child: Text(
                    'Ketuk untuk melihat lokasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'rubik',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //PERATURAN
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              'Peraturan',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ListBody(
              children: rulesConvert()
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '- ' + e,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ))
                  .toList()),
          //TIPE KAMAR
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              'Tipe Kamar',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ListBody(
              children: widget.roomType
                  .map((e) => Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff23243b),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x80000000),
                              offset: Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (e['name'] == '') ? 'Tanpa Nama' : e['name'],
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
                              'Ukuran kamar ${e['room_size']} meter, ${(e['is_bath_room_inside']) ? "Kamar mandi di dalam" : "Kamar mandi di luar"}, Maksimal ${e['max_guess']} Orang/kamar, ${(e['is_furnished']) ? "Sudah ada kasur dan perabotan" : "Belum ada kasur dan perabotan"}.',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Divider(
                              color: Color(0xFF50E3C2),
                            ),
                            Text(
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
                                children: e['facility']
                                    .map<Widget>((e) => Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            '- ' + e,
                                            style: TextStyle(
                                              fontFamily: 'Rubik',
                                              fontSize: 15,
                                              color: const Color(0xffffffff),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ))
                                    .toList()),
                            Divider(
                              color: Color(0xFF50E3C2),
                            ),
                            Text(
                              'Harga',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 17,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            (e['price']['yearly'] == 0)
                                ? Container()
                                : Text(
                                    NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'Rp ',
                                        ).format(e['price']['yearly']) +
                                        ' /Tahun',
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            (e['price']['monthly'] == 0)
                                ? Container()
                                : Text(
                                    NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'Rp ',
                                        ).format(e['price']['monthly']) +
                                        ' /Bulan',
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            (e['price']['weekly'] == 0)
                                ? Container()
                                : Text(
                                    NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'Rp ',
                                        ).format(e['price']['weekly']) +
                                        ' /Pekan',
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            (e['price']['daily'] == 0)
                                ? Container()
                                : Text(
                                    NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'Rp ',
                                        ).format(e['price']['daily']) +
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
      bottomNavigationBar: Container(
        //height: 0,
        padding: EdgeInsets.all(10),
        color: Color(0xFF23243B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: TouchableOpacity(
                child: GestureDetector(
                  onTap: () {
                    showBarModalBottomSheet(
                      context: context,
                      expand: true,
                      builder: (context) => Survey(
                        idProperty: widget.id,
                        namaProperty: widget.nama,
                        photoPropety: widget.photo,
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
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    expand: true,
                    builder: (context) => Booking(
                      data: widget.roomType,
                      propertyName: widget.nama,
                      propertyID: widget.id,
                      propertyPhoto: widget.photo,
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

  List<String> facilityConvert() {
    List<String> facility = [];
    for (var item in facility) {
      switch (item) {
        case 'ruang_santai':
          facility.add('Ruang Santai');
          break;
        case 'garasi':
          facility.add('Garasi');
          break;
        case 'tempat_jemuran':
          facility.add('Tempat Jemuran');
          break;
        case 'dapur':
          facility.add('Dapur');
          break;
        default:
          facility.add(item);
      }
    }
    return facility;
  }

  List<String> parkingFacilityConvert() {
    List<String> facility = [];
    for (var item in widget.parkingFacility) {
      switch (item) {
        case 'sepeda':
          facility.add('Sepeda');
          break;
        case 'motor':
          facility.add('Motor');
          break;
        case 'mobil':
          facility.add('Mobil');
          break;
        default:
          facility.add(item);
      }
    }
    return facility;
  }

  List<String> rulesConvert() {
    List<String> facility = [];
    for (var item in widget.rules) {
      switch (item) {
        case 'free':
          facility.add('Bebas');
          break;
        case 'pets_banned':
          facility.add('Tidak boleh membawa hewan peliharaan');
          break;
        default:
          facility.add(item);
      }
    }
    return facility;
  }

  List<String> categoryConvert() {
    List<String> facility = [];
    for (var item in widget.category) {
      switch (item) {
        case 'male':
          facility.add('Laki-Laki');
          break;
        case 'female':
          facility.add('Perempuan');
          break;
        case 'mix':
          facility.add('Campur');
          break;
        default:
          facility.add(item);
      }
    }
    return facility;
  }

  List<String> environmentAccessConvert() {
    List<String> facility = [];
    for (var item in widget.environmentAccess) {
      switch (item) {
        case 'warung_makan':
          facility.add('Warung Makan');
          break;
        case 'masjid':
          facility.add('Masjid');
          break;
        case 'minimarket':
          facility.add('Minimarket');
          break;
        case 'bank':
          facility.add('Bank');
          break;
        case 'apotek':
          facility.add('Apotek');
          break;
        default:
          facility.add(item);
      }
    }
    return facility;
  }

  String deskripsi() {
    return widget.nama +
        'yang terletak di ' +
        widget.village +
        ', ' +
        widget.district +
        ', ' +
        widget.city +
        ', ' +
        widget.province +
        ' merupakan hunian yang nyaman untuk ditempati. ' +
        'Lokasinya pun strategis  dan memiliki banyak fasilitas. Harganya pun terjangkau. ' +
        widget.description;
  }
}
