part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String userID = '';
  String email = '';
  String photo = '';
  Future<String> getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_name');
  }

  // Future<String> getUserID() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString('user_uid');
  // }

  // Future<String> getEmail() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString('user_email');
  // }

  Future<String> getPhoto() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_photourl');
  }

  @override
  void initState() {
    super.initState();
    getName().then((value) {
      name = value;
      setState(() {});
    });
    // getEmail().then((value) {
    //   email = value;
    //   setState(() {});
    // });
    getPhoto().then((value) {
      photo = value;
      setState(() {});
    });
    // getUserID().then((value) {
    //   userID = value;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        title: Text(name),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.all(10),
          child: CircleAvatar(
            //radius: 30,
            backgroundColor: Color(0xFF23243B),
            backgroundImage: NetworkImage(photo),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            onPressed: () async {
              CekosGoogleSignIn.signOutGoogle();
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();

              sharedPreferences.clear();

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return SignInPage();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          // Container(
          //   margin: EdgeInsets.only(
          //     left: 15,
          //     top: 15,
          //     bottom: 15,
          //     right: 15,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'Likes',
          //         style: TextStyle(
          //           fontFamily: 'Rubik',
          //           fontSize: 20,
          //           color: const Color(0xffffffff),
          //           fontWeight: FontWeight.w500,
          //         ),
          //         textAlign: TextAlign.left,
          //       ),
          //       TouchableOpacity(
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushReplacement(
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return ButtonNavigationBarPage(
          //                     selectedIndex: 1,
          //                   );
          //                 },
          //               ),
          //             );
          //           },
          //           child: Text(
          //             'Lihat Semua',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 15,
          //               color: const Color(0xffffffff),
          //               fontWeight: FontWeight.w500,
          //               decoration: TextDecoration.underline,
          //             ),
          //             textAlign: TextAlign.right,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // MainPageRekomendasi(),
          // Divider(
          //   color: Color(0xFF50E3C2),
          // ),
          // Container(
          //   margin: EdgeInsets.only(
          //     left: 15,
          //     top: 15,
          //     bottom: 15,
          //     right: 15,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'Survey',
          //         style: TextStyle(
          //           fontFamily: 'Rubik',
          //           fontSize: 20,
          //           color: const Color(0xffffffff),
          //           fontWeight: FontWeight.w500,
          //         ),
          //         textAlign: TextAlign.left,
          //       ),
          //       TouchableOpacity(
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushReplacement(
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return ButtonNavigationBarPage(
          //                     selectedIndex: 1,
          //                   );
          //                 },
          //               ),
          //             );
          //           },
          //           child: Text(
          //             'Lihat Semua',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 15,
          //               color: const Color(0xffffffff),
          //               fontWeight: FontWeight.w500,
          //               decoration: TextDecoration.underline,
          //             ),
          //             textAlign: TextAlign.right,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // // MainPageRekomendasi(),
          // Divider(
          //   color: Color(0xFF50E3C2),
          // ),
          // Container(
          //   margin: EdgeInsets.only(
          //     left: 15,
          //     top: 15,
          //     bottom: 15,
          //     right: 15,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'Booking',
          //         style: TextStyle(
          //           fontFamily: 'Rubik',
          //           fontSize: 20,
          //           color: const Color(0xffffffff),
          //           fontWeight: FontWeight.w500,
          //         ),
          //         textAlign: TextAlign.left,
          //       ),
          //       TouchableOpacity(
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushReplacement(
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return ButtonNavigationBarPage(
          //                     selectedIndex: 1,
          //                   );
          //                 },
          //               ),
          //             );
          //           },
          //           child: Text(
          //             'Lihat Semua',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 15,
          //               color: const Color(0xffffffff),
          //               fontWeight: FontWeight.w500,
          //               decoration: TextDecoration.underline,
          //             ),
          //             textAlign: TextAlign.right,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // // MainPageRekomendasi(),
          // Divider(
          //   color: Color(0xFF50E3C2),
          // ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: ListTile.divideTiles(
                context: context,
                color: Color(0xFF50E3C2),
                tiles: [
                  ListTile(
                    title: Text(
                      'Kebijakan Privasi',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Tentang Cekos',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Hubungi Developer',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Beri Nilai',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {},
                  ),
                ]).toList(),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Hak cipta dilindungi undang-undang',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
