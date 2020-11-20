part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF14172B),
        /* appBar: AppBar(
          title: Text('Cekos'),
          backgroundColor: Colors.transparent,
        ), */
        body: Stack(
          children: [
            ListView(
              children: [
                MainPageSlider(),
                Container(
                  margin: EdgeInsets.only(
                    left: 25,
                    top: 30,
                    bottom: 10,
                    right: 22,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rekomendasi',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      TouchableOpacity(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ButtonNavigationBarPage(
                                    selectedIndex: 1,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Lihat Semua',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                MainPageRekomendasi(),
                //MainPageRekomendasi(),
                //PROMO
                Container(
                  margin: EdgeInsets.only(
                    left: 25,
                    top: 30,
                    bottom: 10,
                  ),
                  child: Text(
                    'Promo',
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
                  height: 60,
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  //color: Colors.amber,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xff23243b),
                  ),
                  child: Center(
                    child: Text(
                      'Maaf, Saat ini belum ada promo',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        //fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                //PERLUAS WAWASAN
                Container(
                  margin: EdgeInsets.only(
                    left: 25,
                    top: 30,
                    bottom: 10,
                  ),
                  child: Text(
                    'Perluas Wawasan',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                MainPagePerluasWawasan(),
              ],
            ),
            TouchableOpacity(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchControlPage();
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    left: 20,
                    right: 20,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xff23243b),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x80000000),
                        offset: Offset(4, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xFF50E3C2),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Cari Kampus atau Nama Kost',
                            style: TextStyle(
                              color: Color(0xFF50E3C2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    /* Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Haloo'),
            RaisedButton(
              onPressed: CekosGoogleSignIn.signOutGoogle,
              child: Text('logout'),
            )
          ],
        ),
      ),
    ); */
  }
}
