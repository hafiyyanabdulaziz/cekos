part of 'widgets.dart';

class MainPageRekomendasi extends StatefulWidget {
  @override
  _MainPageRekomendasiState createState() => _MainPageRekomendasiState();
}

class _MainPageRekomendasiState extends State<MainPageRekomendasi> {
  int page = 0;
  List<GetListProperti> dataProperti = new List();
  void getDataUser() async {
    await GetListProperti.connectToAPI(
      limit: 5,
      offset: page,
    ).then((value) {
      setState(() {
        dataProperti = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return dataProperti == null
        ? Text('data tidak ada')
        : Container(
            height: 225,
            width: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: dataProperti.length,
                itemBuilder: (context, i) {
                  return TouchableOpacity(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PropertiDetailPage(
                                getProperti: dataProperti[i],
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 10,
                          //bottom: 10,
                          //top: 10,
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
                              height: 140,
                              width: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.0),
                                  topRight: Radius.circular(14.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(dataProperti[i].photo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //TIPE
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                              ),
                              child: Text(
                                (dataProperti[i].tipe +
                                    ' - ' +
                                    dataProperti[i].penghuni),
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
                              width: 100,
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                dataProperti[i].nama,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
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
                                bottom: 10,
                              ),
                              child: Text(
                                ('Rp ' + dataProperti[i].harga + '/Tahun'),
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 12,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );

    /* ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        ListView.builder(
            itemCount: dataProperti.length,
            itemBuilder: (context, i) {
              return Text(dataProperti[i].id);
            }),
      ],
    ); */
  }
}
