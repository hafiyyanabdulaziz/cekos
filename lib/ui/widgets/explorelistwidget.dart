part of 'widgets.dart';

// ignore: must_be_immutable
class ExploreListWidget extends StatefulWidget {
  String name;
  ExploreListWidget({this.name});

  @override
  _ExploreListWidgetState createState() => _ExploreListWidgetState();
}

class _ExploreListWidgetState extends State<ExploreListWidget> {
  int page = 0;
  List<GetListProperti> dataProperti = new List();
  void getDataUser() async {
    GetListProperti.connectToAPI(
      name: widget.name,
      limit: 30,
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
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ),
          )
        : ListView(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: dataProperti.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
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
                          right: 20,
                          bottom: 10,
                          top: 10,
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
                              height: 200,
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
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            //NAMA
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                dataProperti[i].nama,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 25,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
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
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.0),
                                  topRight: Radius.circular(14.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(dataProperti[i].nama),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          );
  }
}
