part of 'pages.dart';

class LikesTab extends StatefulWidget {
  @override
  _LikesTabState createState() => _LikesTabState();
}

class _LikesTabState extends State<LikesTab> {
  //String userID;
  Future data;

  // Future<String> getUserID() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString('user_uid');
  // }

  @override
  void initState() {
    // getUserID().then((value) {
    //   userID = value;
    //   setState(() {});
    // });
    //userID = getUserID();
    super.initState();
    data = getLikes();
  }

  Future getLikes() async {
    // getUserID().then((value) {
    //   userID = value;
    //   setState(() {});
    // });
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc('RpItJsbedUb3WF08BbUQ0qFxHgs1')
        .collection('likes')
        .get();

    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index].data()['propertyName'],
                      style: TextStyle(color: Colors.amber),
                    ),
                  );
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
