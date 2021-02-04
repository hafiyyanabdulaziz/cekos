import 'package:Cekos/models/koseekerModelMultiple.dart';
import 'package:Cekos/models/koseekerModelSingle.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class KoseekerViewModel {
  Future<KoseekerModelMultiple> getDataKoseekerMultiple(
      {String parameter = ''}) async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://api.koseeker.id/property" + parameter),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = koseekerModelMultipleFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  Future<KoseekerModelSingle> getDataKoseekerSingle(
      {@required String propertyID}) async {
    try {
      print('Ini PropertiID: ' + propertyID);
      http.Response hasil = await http.get(
          Uri.encodeFull("https://api.koseeker.id/property/" + propertyID),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = koseekerModelSingleFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }
}
