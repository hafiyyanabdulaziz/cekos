part of 'widgets.dart';

class MainPagePerluasWawasan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: dataPerluasWawasan.map(
        (item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PerluasWawasanWebView(
                      link: item.link,
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                left: 22,
                right: 22,
                bottom: 10,
              ),
              height: 220,
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.judul,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.deskripsi,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 10,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
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
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                  image: NetworkImage(item.photo),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x80000000),
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          );
          /* Container(
            margin: EdgeInsets.all(10),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPage(properti);
                    },
                  ),
                );
              },
              child: Stack(
                children: [
                  //box
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF23243B),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //atas
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //width: 150,
                              height: MediaQuery.of(context).size.width * 2 / 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(item.link),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                properti.lokasi,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 12,
                                  color: Color(0xFFAF8D19),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                properti.nama,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //harga
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 10,
                            left: 10,
                          ),
                          child: Text(
                            properti.harga,
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
                ],
              ),
            ),
          ); */
        },
      ).toList(),
    );
  }
}
