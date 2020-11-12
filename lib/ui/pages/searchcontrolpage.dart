part of 'pages.dart';

class SearchControlPage extends StatefulWidget {
  @override
  _SearchControlPageState createState() => _SearchControlPageState();
}

class _SearchControlPageState extends State<SearchControlPage> {
  bool cek = false;
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Halo');
  TextEditingController controller = TextEditingController();

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
            hintText: "Masukkan Nama Kampus atau Kost",
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            custom.ExpansionTile(
              headerBackgroundColor: Colors.transparent,
              iconColor: Colors.white,
              //trailing: cusSearchBar,
              initiallyExpanded: true,
              //trailing: ,
              //childrenPadding: EdgeInsets.only(left: 10),
              //backgroundColor: Colors.white,
              title: Text(
                "Property",
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
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
              ],
            ),
            custom.ExpansionTile(
              headerBackgroundColor: Colors.transparent,
              iconColor: Colors.white,
              //trailing: cusSearchBar,
              initiallyExpanded: true,
              //trailing: ,
              //childrenPadding: EdgeInsets.only(left: 10),
              //backgroundColor: Colors.white,
              title: Text(
                "Property",
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
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
              ],
            ),
            custom.ExpansionTile(
              headerBackgroundColor: Colors.transparent,
              iconColor: Colors.white,
              //trailing: cusSearchBar,
              initiallyExpanded: true,
              //trailing: ,
              //childrenPadding: EdgeInsets.only(left: 10),
              //backgroundColor: Colors.white,
              title: Text(
                "Property",
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
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
              ],
            ),
            custom.ExpansionTile(
              headerBackgroundColor: Colors.transparent,
              iconColor: Colors.white,
              //trailing: cusSearchBar,
              initiallyExpanded: true,
              //trailing: ,
              //childrenPadding: EdgeInsets.only(left: 10),
              //backgroundColor: Colors.white,
              title: Text(
                "Property",
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
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.amber,
                  controlAffinity: ListTileControlAffinity.leading,
                  //checkColor: Colors.white,
                  title: const Text(
                    'Animate Slowly',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: cek,
                  onChanged: (bool value) {
                    setState(() {
                      cek = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
