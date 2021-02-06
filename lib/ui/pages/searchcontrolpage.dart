part of 'pages.dart';

class SearchControlPage extends StatefulWidget {
  @override
  _SearchControlPageState createState() => _SearchControlPageState();
}

class _SearchControlPageState extends State<SearchControlPage> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Halo');
  TextEditingController controller = TextEditingController();

  bool kost = true;
  bool kontrakan = false;
  bool apartement = false;
  bool harian = false;
  bool mingguan = false;
  bool bulanan = false;
  bool tahunan = false;
  bool pria = false;
  bool wanita = false;
  bool campur = false;
  bool kosongan = false;
  bool isi = false;
  bool sepeda = false;
  bool motor = false;
  bool mobil = false;
  bool wifi = false;
  bool kabel = false;
  bool lainlain = false;
  bool satpam = false;
  bool cctv = false;
  bool penjagakost = false;

  String typeProperty() {
    return ((kost) ? '&type=kost' : '') +
        ((kontrakan) ? '&type=kontrakan' : '') +
        ((apartement) ? '&type=apartemen' : '');
  }

  String durasiMenginap() {
    return ((harian) ? '&kind=daily' : '') +
        ((mingguan) ? '&kind=weekly' : '') +
        ((bulanan) ? '&kind=monthly' : '') +
        ((tahunan) ? '&kind=yearly' : '');
  }

  String kategori() {
    return ((pria) ? '&category=male' : '') +
        ((wanita) ? '&tcategory=female' : '') +
        ((campur) ? '&category=mix' : '');
  }

  String furniture() {
    return ((kosongan) ? '&room_type=kosong' : '') +
        ((isi) ? '&room_type=isi' : '');
  }

  String tempatParkir() {
    return ((sepeda) ? '&parking_facility=sepeda' : '') +
        ((motor) ? '&tcategory=motor' : '') +
        ((mobil) ? '&category=mobil' : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        //centerTitle: true,
        title: TextField(
          autofocus: true,
          onSubmitted: (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color(0xFF23243B),
                      title: Text('Search'),
                    ),
                    backgroundColor: Color(0xFF14172B),
                    body: ExploreListWidget(
                      name: controller.text,
                      durasiMenginap: durasiMenginap(),
                      furniture: furniture(),
                      kategori: kategori(),
                      tempatParkir: tempatParkir(),
                      typeProperty: typeProperty(),
                    ),
                  );
                },
              ),
            );
          },
          onChanged: (value) {
            setState(() {});
          },
          cursorColor: Colors.white,
          controller: controller,
          //textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            border: InputBorder.none,
            /* UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ), */
            /* suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ), */
            hintText: "Masukkan Nama Kost",
            hintStyle: TextStyle(
              color: Color(0xFF50E3C2),
              fontSize: 13,
            ),
          ),
          style: TextStyle(
            color: Colors.white,
            //height: 1,

            //fontSize: 16.0,
          ),
        ),
        actions: [
          IconButton(
            icon: cusIcon,
            onPressed: () {
              print(typeProperty());
              print(durasiMenginap());
              print(kategori());
              print(furniture());
              print(tempatParkir());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Color(0xFF23243B),
                        title: Text('Search'),
                      ),
                      backgroundColor: Color(0xFF14172B),
                      body: ExploreListWidget(
                        name: controller.text,
                        durasiMenginap: durasiMenginap(),
                        furniture: furniture(),
                        kategori: kategori(),
                        tempatParkir: tempatParkir(),
                        typeProperty: typeProperty(),
                      ),
                    );
                  },
                ),
              );
              /* setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Hafo",
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text('Halo');
                }
              }); */
            },
          ),
        ],
      ),
      body: filter(),
    );
  }

  Widget filter() {
    return Container(
      //padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          //type property
          custom.ExpansionTile(
            headerBackgroundColor: Colors.transparent,
            iconColor: Colors.white,
            //trailing: cusSearchBar,
            initiallyExpanded: true,
            //trailing: ,
            //childrenPadding: EdgeInsets.only(left: 10),
            //backgroundColor: Colors.white,
            title: Text(
              "Type Property",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Kost',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: kost,
                onChanged: (bool value) {
                  setState(() {
                    kost = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Kontrakan',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: kontrakan,
                onChanged: (bool value) {
                  setState(() {
                    kontrakan = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Apartement',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: apartement,
                onChanged: (bool value) {
                  setState(() {
                    apartement = value;
                  });
                },
              ),
            ],
          ),
          //durasi menginap
          custom.ExpansionTile(
            headerBackgroundColor: Colors.transparent,
            iconColor: Colors.white,
            //trailing: cusSearchBar,
            initiallyExpanded: true,
            //trailing: ,
            //childrenPadding: EdgeInsets.only(left: 10),
            //backgroundColor: Colors.white,
            title: Text(
              "Durasi Menginap",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Harian',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: harian,
                onChanged: (bool value) {
                  setState(() {
                    harian = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Mingguan',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: mingguan,
                onChanged: (bool value) {
                  setState(() {
                    mingguan = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Bulanan',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: bulanan,
                onChanged: (bool value) {
                  setState(() {
                    bulanan = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Tahunan',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: tahunan,
                onChanged: (bool value) {
                  setState(() {
                    tahunan = value;
                  });
                },
              ),
            ],
          ),
          //kategori
          custom.ExpansionTile(
            headerBackgroundColor: Colors.transparent,
            iconColor: Colors.white,
            //trailing: cusSearchBar,
            initiallyExpanded: true,
            //trailing: ,
            //childrenPadding: EdgeInsets.only(left: 10),
            //backgroundColor: Colors.white,
            title: Text(
              "Kategori",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Pria',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: pria,
                onChanged: (bool value) {
                  setState(() {
                    pria = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Wanita',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: wanita,
                onChanged: (bool value) {
                  setState(() {
                    wanita = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Campur',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: campur,
                onChanged: (bool value) {
                  setState(() {
                    campur = value;
                  });
                },
              ),
            ],
          ),
          //furniture
          custom.ExpansionTile(
            headerBackgroundColor: Colors.transparent,
            iconColor: Colors.white,
            //trailing: cusSearchBar,
            initiallyExpanded: true,
            //trailing: ,
            //childrenPadding: EdgeInsets.only(left: 10),
            //backgroundColor: Colors.white,
            title: Text(
              "Furniture",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Kosongan',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: kosongan,
                onChanged: (bool value) {
                  setState(() {
                    kosongan = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Isi',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: isi,
                onChanged: (bool value) {
                  setState(() {
                    isi = value;
                  });
                },
              ),
            ],
          ),
          //tempat parkir
          custom.ExpansionTile(
            headerBackgroundColor: Colors.transparent,
            iconColor: Colors.white,
            //trailing: cusSearchBar,
            initiallyExpanded: true,
            //trailing: ,
            //childrenPadding: EdgeInsets.only(left: 10),
            //backgroundColor: Colors.white,
            title: Text(
              "Tempat Parkir",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: <Widget>[
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Sepeda',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: sepeda,
                onChanged: (bool value) {
                  setState(() {
                    sepeda = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Motor',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: motor,
                onChanged: (bool value) {
                  setState(() {
                    motor = value;
                  });
                },
              ),
              CheckboxListTile(
                activeColor: Colors.amber,
                controlAffinity: ListTileControlAffinity.leading,
                //checkColor: Colors.white,
                title: const Text(
                  'Mobil',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: mobil,
                onChanged: (bool value) {
                  setState(() {
                    mobil = value;
                  });
                },
              ),
            ],
          ),
          //internet
          // custom.ExpansionTile(
          //   headerBackgroundColor: Colors.transparent,
          //   iconColor: Colors.white,
          //   //trailing: cusSearchBar,
          //   initiallyExpanded: true,
          //   //trailing: ,
          //   //childrenPadding: EdgeInsets.only(left: 10),
          //   //backgroundColor: Colors.white,
          //   title: Text(
          //     "Internet",
          //     style: TextStyle(
          //       fontSize: 18.0,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          //   children: <Widget>[
          //     CheckboxListTile(
          //       activeColor: Colors.amber,
          //       controlAffinity: ListTileControlAffinity.leading,
          //       //checkColor: Colors.white,
          //       title: const Text(
          //         'Wi-Fi',
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       value: wifi,
          //       onChanged: (bool value) {
          //         setState(() {
          //           wifi = value;
          //         });
          //       },
          //     ),
          //     CheckboxListTile(
          //       activeColor: Colors.amber,
          //       controlAffinity: ListTileControlAffinity.leading,
          //       //checkColor: Colors.white,
          //       title: const Text(
          //         'Kabel',
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       value: kabel,
          //       onChanged: (bool value) {
          //         setState(() {
          //           kabel = value;
          //         });
          //       },
          //     ),
          //     CheckboxListTile(
          //       activeColor: Colors.amber,
          //       controlAffinity: ListTileControlAffinity.leading,
          //       //checkColor: Colors.white,
          //       title: const Text(
          //         'Lain-lain',
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       value: lainlain,
          //       onChanged: (bool value) {
          //         setState(() {
          //           lainlain = value;
          //         });
          //       },
          //     ),
          //   ],
          // ),
          //keamanan
          // custom.ExpansionTile(
          //   headerBackgroundColor: Colors.transparent,
          //   iconColor: Colors.white,
          //   //trailing: cusSearchBar,
          //   initiallyExpanded: true,
          //   //trailing: ,
          //   //childrenPadding: EdgeInsets.only(left: 10),
          //   //backgroundColor: Colors.white,
          //   title: Text(
          //     "Keamanan",
          //     style: TextStyle(
          //       fontSize: 18.0,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          //   children: <Widget>[
          //     CheckboxListTile(
          //       activeColor: Colors.amber,
          //       controlAffinity: ListTileControlAffinity.leading,
          //       //checkColor: Colors.white,
          //       title: const Text(
          //         'Satpam',
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       value: satpam,
          //       onChanged: (bool value) {
          //         setState(() {
          //           satpam = value;
          //         });
          //       },
          //     ),
          //     CheckboxListTile(
          //       activeColor: Colors.amber,
          //       controlAffinity: ListTileControlAffinity.leading,
          //       //checkColor: Colors.white,
          //       title: const Text(
          //         'CCTV',
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       value: cctv,
          //       onChanged: (bool value) {
          //         setState(() {
          //           cctv = value;
          //         });
          //       },
          //     ),
          //     CheckboxListTile(
          //       activeColor: Colors.amber,
          //       controlAffinity: ListTileControlAffinity.leading,
          //       //checkColor: Colors.white,
          //       title: const Text(
          //         'Penjaga Kost',
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       value: penjagakost,
          //       onChanged: (bool value) {
          //         setState(() {
          //           penjagakost = value;
          //         });
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
