part of 'services.dart';

class GetListProperti {
  GetListProperti({
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

  factory GetListProperti.getData(Map<String, dynamic> object) {
    /* List<String> gallery = List<String>.from(object['gallery']);
    gallery.add(object['main_image']); */
    //print("HALOOOOO " + List<String>.from(object['gallery']).toString());
    /* List<dynamic> gallery;
    for (var i = 0; i < object['gallery'].length; i++) {
      gallery.add(object['gallery'][i]);
    } */

    return GetListProperti(
      photo: object['main_image'],
      tipe: object['type'][0],
      penghuni: object['category'][0].toString(),
      harga: object['room_type'][0]['price']['yearly'],
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

  static Future<List<GetListProperti>> connectToAPI({
    int limit = 10,
    int offset = 0,
    String sort = "",
    String area = "",
    String kind = "",
    int minPrice = 0,
    int maxPrice = 999999999,
    String roomType = "",
    String name = "",
    String available = "",
    String type = "",
    String category = "",
    int minDPPrice = 0,
    int maxDPPrice = 999999999,
    String lon = "",
    String lat = "",
    String parkingFacility = "",
    String roomFacility = "",
    String publicFacility = "",
    //tambahan
    String typeProperty = '',
    String durasiMenginap = '',
    String kategori = '',
    String furniture = '',
    String tempatParkir = '',
  }) async {
    String url = "https://api.koseeker.id/property?limit=" +
        limit.toString() +
        "&offset=" +
        offset.toString() +
        typeProperty +
        durasiMenginap +
        kategori +
        furniture +
        tempatParkir +
        "&name=" +
        name;
    print('-------------' + url);
    // "&sort=" +
    // sort +
    // "&area=" +
    // area +
    // "&kind=" +
    // kind +
    // "&min_price=" +
    // minPrice.toString() +
    // "&max_price=" +
    // maxPrice.toString() +
    // "&room_type=" +
    // roomType +
    // "&name=" +
    // name +
    // "&available=" +
    // available +
    // "&type=" +
    // type +
    // "&category=" +
    // category +
    // "&min_dp_price=" +
    // minDPPrice.toString() +
    // "&max_dp_price=" +
    // maxDPPrice.toString() +
    // "&lon=" +
    // lon +
    // "&lat=" +
    // lat +
    // "&parking_facility=" +
    // parkingFacility +
    // "&room_facility=" +
    // roomFacility +
    // "&public_facility=" +
    // publicFacility;

    var apiRequest = await http.get(url);
    var jsonObject = json.decode(apiRequest.body);
    List<dynamic> propertiData = (jsonObject as Map<String, dynamic>)['data'];

    List<GetListProperti> listPropertiData = [];
    for (var i = 0; i < propertiData.length; i++) {
      listPropertiData.add(GetListProperti.getData(propertiData[i]));
    }

    print('halooo hafi= ' + propertiData.toString());

    return listPropertiData;
  }
}
