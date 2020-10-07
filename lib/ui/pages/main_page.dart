part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      /* appBar: AppBar(
        title: Text('Cekos'),
        backgroundColor: Colors.transparent,
      ), */
      body: ListView(
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
                GestureDetector(
                  onTap: () {
                    print('kokokoko');
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
              ],
            ),
          ),
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
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
          Text('Halooo'),
        ],
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
