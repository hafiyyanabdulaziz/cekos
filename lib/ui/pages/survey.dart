part of 'pages.dart';

// ignore: must_be_immutable
class Survey extends StatefulWidget {
  String data = '';

  Survey({this.data});

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
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
              selectionColor: Colors.amber,
              showNavigationArrow: true,
              enablePastDates: false,
              todayHighlightColor: Colors.red,
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.single,
            ),
          ),
          (_selectedDate == '') ? Container() : Text(widget.data),
        ],
      ),
    );
  }
}
