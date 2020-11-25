part of 'pages.dart';

class BookingTabs extends StatefulWidget {
  @override
  _BookingTabsState createState() => _BookingTabsState();
}

class _BookingTabsState extends State<BookingTabs> {
  //String userID;
  Future _data;

  Future<String> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_uid');
  }

  @override
  void initState() {
    //getUserID().then((value) => userID = value);
    super.initState();
    _data = getBooking();
  }

  Future getBooking() async {
    String userID = await getUserID();
    //debugPrint('ini masuk gak datanya ya ' + userID);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('booking')
        .get();

    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      body: Container(
        child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return TouchableOpacity(
                    onTap: () {},
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
                                image: NetworkImage(snapshot.data[index]
                                    .data()['propertyPhotoURL']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //STATUS
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xffAF8D19),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                            ),
                            child: Text(
                              (snapshot.data[index].data()['status']),
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
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              snapshot.data[index].data()['propertyName'],
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
                          //TIPE KAMAR
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                            ),
                            child: Text(
                              ('Tipe Kamar : ' +
                                  snapshot.data[index].data()['tipeKamar']),
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 17,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          //TANGGAL
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                            ),
                            child: Text(
                              ('Mulai Menginap : ' +
                                  DateFormat('dd MMMM yyy')
                                      .format(snapshot.data[index]
                                          .data()['tanggal']
                                          .toDate())
                                      .toString()),
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 17,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          //DURASI
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                            ),
                            child: Text(
                              ('Durasi Menginap : ' +
                                  snapshot.data[index].data()['durasi']),
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 17,
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
                              top: 10,
                              bottom: 20,
                            ),
                            child: Text(
                              ('Harga : ' +
                                  NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'Rp ',
                                  ).format(
                                    snapshot.data[index].data()['harga'],
                                  )),
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 17,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  // return ListTile(
                  //   title: Text(
                  //     snapshot.data[index].data()['propertyName'],
                  //     style: TextStyle(color: Colors.amber),
                  //   ),
                  // );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
