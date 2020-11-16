part of 'pages.dart';

// ignore: must_be_immutable
class PropertiDetailPage extends StatelessWidget {
  GetListProperti getProperti;

  PropertiDetailPage({@required this.getProperti});

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
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          DetailPageSlider(
            dataPhotos: getProperti.gallery,
          ),
          //TIPE
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Text(
              (getProperti.tipe + ' - ' + getProperti.penghuni),
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
              getProperti.nama,
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
              getProperti.daerah,
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
                        lat: getProperti.lat,
                        lng: getProperti.lng,
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
                color: Colors.blue,
                height: (MediaQuery.of(context).size.width - 20) / 2,
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
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
                        data: getProperti.nama,
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
                      data: getProperti.nama,
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
    for (var item in getProperti.facility) {
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
    for (var item in getProperti.parkingFacility) {
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

  List<String> categoryConvert() {
    List<String> facility = [];
    for (var item in getProperti.category) {
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
    for (var item in getProperti.environmentAccess) {
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
    return getProperti.nama +
        'yang terletak di ' +
        getProperti.village +
        ', ' +
        getProperti.district +
        ', ' +
        getProperti.city +
        ', ' +
        getProperti.province +
        ' merupakan hunian yang nyaman untuk ditempati. ' +
        'Lokasinya pun strategis  dan memiliki banyak fasilitas. Harganya pun terjangkau. ' +
        getProperti.description;
  }
}
