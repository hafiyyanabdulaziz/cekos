part of 'pages.dart';

// ignore: must_be_immutable
class Booking extends StatefulWidget {
  String data = '';

  Booking({this.data});
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  //String data = widget.data;
  String _selectedDate = '';

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
        title: Text('Pilih Tanggal Booking'),
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
      height: 100,
      padding: EdgeInsets.all(10),
      color: Color(0xFF23243B),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Anda akan survey ke ' +
                widget.data +
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
