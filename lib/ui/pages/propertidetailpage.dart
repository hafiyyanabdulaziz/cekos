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
          RaisedButton(
            onPressed: () {
              showBarModalBottomSheet(
                context: context,
                expand: true,
                builder: (context) => Lokasi(),
              );
            },
            child: Text('data'),
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
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(getProperti.nama),
                Text(getProperti.village),
                Text(getProperti.district),
                Text(getProperti.city),
                Text(getProperti.province),
                Text(getProperti.facility.toString()),
                Text(getProperti.environmentAccess.toString()),
                Text(getProperti.parkingFacility.toString()),
                Text(getProperti.category.toString()),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ],
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
