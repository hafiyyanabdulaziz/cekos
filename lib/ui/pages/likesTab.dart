part of 'pages.dart';

class LikesTab extends StatefulWidget {
  @override
  _LikesTabState createState() => _LikesTabState();
}

class _LikesTabState extends State<LikesTab> {
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
    _data = getLikes();
  }

  Future getLikes() async {
    String userID = await getUserID();
    //debugPrint('ini masuk gak datanya ya ' + userID);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('likes')
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
              return (snapshot.data.length == 0)
                  ? Center(
                      child: Text(
                        'Tidak ada property yang Anda Like',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 14,
                          color: const Color(0xffffffff),
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return TouchableOpacity(
                          onTap: () {
                            print('Loading jalan gak');
                            KoseekerViewModel()
                                .getDataKoseekerSingle(
                                    propertyID: snapshot.data[index]
                                        .data()['propertyID'])
                                .then(
                                  (value) => {
                                    print(
                                        'Ini Hasil value: ' + value.toString()),
                                    if (value != null)
                                      {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return PropertiDetailPage(
                                                  koseekerModelSingle: value,
                                                );
                                              },
                                            ),
                                          );
                                          print('ada delay gak');
                                        }),
                                      }
                                    else
                                      {
                                        print('Tidak ada hasil'),
                                        Flushbar(
                                          duration:
                                              Duration(milliseconds: 2500),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xffaf8d19),
                                          message:
                                              'Maaf, hunian sudah tidak tersedia',
                                        )..show(context),
                                      },
                                  },
                                );
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
                                      (MediaQuery.of(context).size.width - 40) *
                                          0.4,
                                  width:
                                      (MediaQuery.of(context).size.width - 40) *
                                          0.4,
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
    // return Scaffold(
    //   backgroundColor: Color(0xFF14172B),
    //   body: Center(
    //     child: Text(
    //       'Coming Soon',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //   ),
    // );
    //====================================
    // return Scaffold(
    //   body: RaisedButton(
    //     onPressed: () async {
    //       // DocumentSnapshot snapshot = await DatabaseFirestore.getLikes('1234');
    //       // print(snapshot.data());
    //       FirebaseFirestore.instance
    //           .collection('users')
    //           .doc(userID)
    //           .collection('likes')
    //           .get()
    //           .then((QuerySnapshot querySnapshot) => {
    //                 querySnapshot.docs.forEach((doc) {
    //                   print(doc['propertyName']);
    //                 })
    //               });
    //     },
    //   ),
    // );
    //=========================================
    // return Scaffold(
    //   body: FutureBuilder(
    //     future: FirebaseFirestore.instance
    //         .collection('users')
    //         .doc(userID)
    //         .collection('likes')
    //         .get(),
    //     builder: (_, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         print(snapshot.data());
    //         return Center(
    //           child: Text('Loading..'),
    //         );
    //       } else {
    //         //Map<String, dynamic> data = snapshot.data.data();
    //         //print(data);
    //         return ListView.builder(
    //           itemCount: snapshot.data.data().length,
    //           itemBuilder: (_, index) {
    //             return Text('data');
    //           },
    //         );
    //       }
    //     },
    //   ),
    // );
  }
}
