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

  Future<String> getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_email');
  }

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
    getEmail().then((value) {
      email = value;
      setState(() {});
    });
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
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 10,
          ),
          //isi profile
          Container(
            //height: 200,
            color: Color(0xff23243b),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      image: DecorationImage(
                        image: NetworkImage(photo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      bottom: 20,
                    ),
                    child: Text(
                      email,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff23243b),
            child: ListView(
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WebviewDetail(
                                  link:
                                      'https://cekos.kitahukomputer.com/webview/kebijakanprivasi.html',
                                  textAppBar: 'Kebijakan Privasi');
                            },
                          ),
                        );
                      },
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WebviewDetail(
                                  link:
                                      'https://cekos.kitahukomputer.com/webview/tentangcekos.html',
                                  textAppBar: 'Tentang Cekos');
                            },
                          ),
                        );
                      },
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
                      onTap: () async {
                        await launch('https://wa.me/6281283793435');
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Bantu Kembangkan',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () async {
                        await launch(
                            'https://github.com/hafiyyanabdulaziz?tab=repositories&q=cekos');
                      },
                    ),
                  ]).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.red,
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
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
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
