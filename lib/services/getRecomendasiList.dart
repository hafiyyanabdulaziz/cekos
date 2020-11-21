part of 'services.dart';

class GetRecomendasiList {
  List<String> cfFromJson(String str) =>
      List<String>.from(json.decode(str).map((x) => x));

  // String cfToJson(List<String> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x)));

  Future<List> getRecomendasi() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull(
              "https://hafiyyanabdulaziz.pythonanywhere.com/get/123/"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = cfFromJson(hasil.body);
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
