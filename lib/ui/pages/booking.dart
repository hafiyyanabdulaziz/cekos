part of 'pages.dart';

// ignore: must_be_immutable
class Booking extends StatefulWidget {
  List<Map> data;

  Booking({@required this.data});
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  //String data = widget.data;
  String _selectedDate = '';
  List<Map> pilih = [];

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _selectedDate = DateFormat('dd-MM-yyy').format(args.value).toString();
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFF23243B),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              'Pilih tanggal Booking',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: SfDateRangePicker(
              selectionColor: Color(0xffaf8d19),
              showNavigationArrow: true,
              enablePastDates: false,
              todayHighlightColor: Color(0xFF23243B),
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.single,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              'Pilih tipe kamar',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(widget.data.length);
                  //pilih.add({'id': widget.data[index]['id']});
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff23243b),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x80000000),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (widget.data[index]['name'] == '')
                            ? 'Tanpa Nama'
                            : widget.data[index]['name'],
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Divider(
                        color: Color(0xFF50E3C2),
                      ),
                      Text(
                        'Ukuran kamar ${widget.data[index]['room_size']} meter, ${(widget.data[index]['is_bath_room_inside']) ? "Kamar mandi di dalam" : "Kamar mandi di luar"}, Maksimal ${widget.data[index]['max_guess']} Orang/kamar, ${(widget.data[index]['is_furnished']) ? "Sudah ada kasur dan perabotan" : "Belum ada kasur dan perabotan"}.',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 15,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Divider(
                        color: Color(0xFF50E3C2),
                      ),
                      Text(
                        'Fasilitas Kamar',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 17,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      ListBody(
                          children: widget.data[index]['facility']
                              .map<Widget>((e) => Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      '- ' + e,
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontSize: 15,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ))
                              .toList()),
                      Divider(
                        color: Color(0xFF50E3C2),
                      ),
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 17,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      (widget.data[index]['price']['yearly'] == 0)
                          ? Container()
                          : Text(
                              NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'Rp ',
                                  ).format(
                                      widget.data[index]['price']['yearly']) +
                                  ' /Tahun',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      (widget.data[index]['price']['monthly'] == 0)
                          ? Container()
                          : Text(
                              NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'Rp ',
                                  ).format(
                                      widget.data[index]['price']['monthly']) +
                                  ' /Bulan',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      (widget.data[index]['price']['weekly'] == 0)
                          ? Container()
                          : Text(
                              NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'Rp ',
                                  ).format(
                                      widget.data[index]['price']['weekly']) +
                                  ' /Pekan',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      (widget.data[index]['price']['daily'] == 0)
                          ? Container()
                          : Text(
                              NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'Rp ',
                                  ).format(
                                      widget.data[index]['price']['daily']) +
                                  ' /Hari',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
      bottomNavigationBar: (_selectedDate == '') ? null : konfirmasi(),
    );
  }

  Widget konfirmasi() {
    return Container(
      //margin: EdgeInsets.all(20),
      height: 100,
      padding: EdgeInsets.all(10),
      color: Color(0xFF23243B),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Anda akan survey ke ' +
                //widget.data.nama +
                'pada tanggal ' +
                _selectedDate,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Color(0xffaf8d19),
              child: Text('CONFIRM'),
            ),
          ),
        ],
      ),
    );
  }
}
