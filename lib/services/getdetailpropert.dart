part of 'services.dart';

class GetDetailProperti {
  GetDetailProperti({
    this.id,
    this.name,
    this.photo,
    this.photos,
  });

  String id;
  String name;
  String photo;
  List<String> photos;

  factory GetDetailProperti.getDetail(Map<String, dynamic> object) {
    List<String> gallery = List<String>.from(object['gallery']);
    gallery.add(object['main_image']);
    //print("HALOOOOO " + List<String>.from(object['gallery']).toString());
    /* List<dynamic> gallery;
    for (var i = 0; i < object['gallery'].length; i++) {
      gallery.add(object['gallery'][i]);
    } */

    return GetDetailProperti(
      id: object['id'].toString(),
      name: object['name'],
      photo: object['main_image'],
      photos: gallery, //List<String>.from(object['gallery']),
    );
  }

  static Future<GetDetailProperti> connectToAPI() async {
    String apiURL = "https://api.koseeker.id/property/5bb43be781e8a80001c2dbf7";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var detailData = (jsonObject as Map<String, dynamic>)['data'];

    print(detailData);

    return GetDetailProperti.getDetail(detailData);
  }
}
