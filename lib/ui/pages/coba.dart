import 'package:Cekos/services/services.dart';
import 'package:flutter/material.dart';

class Coba extends StatefulWidget {
  @override
  _CobaState createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: ListView(
        children: [
          Text('data'),
          RaisedButton(
            onPressed: () {
              DatabaseFirestore.createOrUpdateBooking(
                  userID: '1234',
                  propertyID: 'p343434',
                  propertyName: 'Rumah',
                  propertyPhotoURL: 'hbfhkdbfkhbadkfhb');
            },
          )
        ],
      ),
    );
  }
}
