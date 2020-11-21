part of 'services.dart';

class GetDetailProperti {
  GetDetailProperti({
    @required this.photo,
    @required this.tipe,
    @required this.penghuni,
    @required this.harga,
    @required this.nama,
    @required this.id,
    @required this.daerah,
    @required this.gallery,
    @required this.village,
    @required this.district,
    @required this.city,
    @required this.province,
    @required this.facility,
    @required this.environmentAccess,
    @required this.parkingFacility,
    @required this.category,
    @required this.description,
    @required this.lat,
    @required this.lng,
    @required this.rules,
    @required this.roomType,
  });

  String photo =
      "https://1.bp.blogspot.com/-fcqYJ8sOUtw/X0zEQsZWkVI/AAAAAAAAI24/hAq1jqHHAhYIZoRqkSsdlh3QBBfYcYAwgCLcBGAsYHQ/s1600/fiksioner-no-image.png";
  String tipe;
  String penghuni;
  int harga;
  String nama;
  String id;
  String daerah;
  List<String> gallery;

  String village;
  String district;
  String city;
  String province;
  List<String> facility;
  List<String> environmentAccess;
  List<String> parkingFacility;
  List<String> category;
  String description;
  List<String> rules;
  List<Map> roomType;

  double lat;
  double lng;

  factory GetDetailProperti.getDetail(Map<String, dynamic> object) {
    //List<String> gallery = List<String>.from(object['gallery']);
    //gallery.add(object['main_image']);
    //print("HALOOOOO " + List<String>.from(object['gallery']).toString());
    /* List<dynamic> gallery;
    for (var i = 0; i < object['gallery'].length; i++) {
      gallery.add(object['gallery'][i]);
    } */

    return GetDetailProperti(
      photo: object['main_image'],
      tipe: object['type'][0],
      penghuni: object['category'][0].toString(),
      harga: object['detail_house_price']['yearly'],
      nama: object['name'],
      id: object['id'],
      daerah: object['address']["city"] + " - " + object['address']['village'],
      gallery: List<String>.from(object['gallery']),
      village: object['address']['village'],
      category: List<String>.from(object['category']),
      city: object['address']["city"],
      district: object['address']["district"],
      environmentAccess: List<String>.from(object['environment_access']),
      facility: List<String>.from(object['facility']),
      parkingFacility: List<String>.from(object['parking_facility']),
      province: object['address']["province"],
      description: object['description'],
      lat: object['address']['location']['coordinates'][1],
      lng: object['address']['location']['coordinates'][0],
      rules: List<String>.from(object['rules']),
      roomType: List<Map>.from(object['room_type']),
    );
  }

  static Future<GetDetailProperti> connectToAPI({String propertyID}) async {
    String apiURL = "https://api.koseeker.id/property/" + propertyID;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var detailData = (jsonObject as Map<String, dynamic>)['data'];

    print(detailData);

    return GetDetailProperti.getDetail(detailData);
  }
}
