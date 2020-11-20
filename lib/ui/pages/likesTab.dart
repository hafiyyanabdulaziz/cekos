part of 'pages.dart';

class LikesTab extends StatefulWidget {
  @override
  _LikesTabState createState() => _LikesTabState();
}

class _LikesTabState extends State<LikesTab> {
  String userID;
  Future getLikes() async {
    var firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('likes')
        .get();

    return querySnapshot.docs;
  }

  Future<String> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_uid');
  }

  @override
  void initState() {
    super.initState();

    getUserID().then((value) {
      userID = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
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
