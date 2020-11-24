part of 'pages.dart';

class Survey extends StatefulWidget {
  final String namaProperty;
  final String idProperty;
  final String photoPropety;

  Survey({
    this.namaProperty,
    this.idProperty,
    this.photoPropety,
  });

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  //String data = widget.data;
  String _selectedDate = '';
  DateTime tanggal;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      tanggal = args.value;
      _selectedDate = DateFormat('dd-MM-yyy').format(args.value).toString();
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Tanggal Survey'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFF23243B),
      ),
      body: Column(
        children: [
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
        ],
      ),
      bottomNavigationBar: (_selectedDate == '') ? null : konfirmasi(),
    );
  }

  Widget konfirmasi() {
    return Container(
      //margin: EdgeInsets.all(20),
      height: 140,
      padding: EdgeInsets.all(10),
      color: Color(0xFF23243B),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Anda akan survey ke ' +
                widget.namaProperty +
                'pada tanggal ' +
                _selectedDate +
                '. Untuk informasi selengkapnya mengenai survey, akan Kami kirimkan melalui e-mail.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: RaisedButton(
              onPressed: () {
                Future<String> getUserID() async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  return sharedPreferences.getString('user_uid');
                }

                getUserID().then((userID) {
                  print('halo' + userID);
                  DatabaseFirestore.createOrUpdateSurvey(
                      userID: userID,
                      propertyID: widget.idProperty,
                      propertyName: widget.namaProperty,
                      propertyPhotoURL: widget.photoPropety,
                      tanggal: tanggal);
                  print('halo' + userID);
                });

                Navigator.pop(context);
                Flushbar(
                  duration: Duration(milliseconds: 2500),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Color(0xffaf8d19),
                  message:
                      'Survey ke ${widget.namaProperty} pada tanggal $_selectedDate berhasil ditambahkan',
                )..show(context);
              },
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
