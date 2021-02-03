part of 'pages.dart';

class SurveyTab extends StatefulWidget {
  @override
  _SurveyTabState createState() => _SurveyTabState();
}

class _SurveyTabState extends State<SurveyTab> {
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
    _data = getSurveys();
  }

  Future getSurveys() async {
    String userID = await getUserID();
    //debugPrint('ini masuk gak datanya ya ' + userID);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('survey')
        .get();

    return querySnapshot.docs;
  }

  void _cardOnTap(String lokasi, String tanggal) {
    launch(
        'https://wa.me/6281283793435/?text=Haloo, Saya ingin survey ke $lokasi pada tanggal $tanggal');
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
                    onTap: () {
                      _cardOnTap(
                          snapshot.data[index].data()['propertyName'],
                          DateFormat('dd MMMM yyy')
                              .format(snapshot.data[index]
                                  .data()['tanggal']
                                  .toDate())
                              .toString());
                    },
                    child: Container(
                      //height: 30,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xff23243b),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x80000000),
                            offset: Offset(4, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          //PHOTO
                          Container(
                            height:
                                (MediaQuery.of(context).size.width - 40) * 0.4,
                            width:
                                (MediaQuery.of(context).size.width - 40) * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(snapshot.data[index]
                                    .data()['propertyPhotoURL']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //Nama dan Tanggal
                          Column(
                            children: [
                              //TANGGAL
                              Container(
                                padding: EdgeInsets.all(10),
                                width:
                                    (MediaQuery.of(context).size.width - 40) *
                                        0.6,
                                child: Text(
                                  DateFormat('dd MMMM yyy')
                                      .format(snapshot.data[index]
                                          .data()['tanggal']
                                          .toDate())
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              //NAMA
                              Container(
                                padding: EdgeInsets.all(10),
                                width:
                                    (MediaQuery.of(context).size.width - 40) *
                                        0.6,
                                child: Text(
                                  snapshot.data[index].data()['propertyName'],
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    fontSize: 18,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
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
