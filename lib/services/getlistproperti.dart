part of 'services.dart';

class GetListProperti {
  GetListProperti({
    @required this.photo,
    @required this.tipe,
    //@required this.penghuni,
    @required this.harga,
    @required this.nama,
    @required this.id,
  });

  String photo =
      "https://1.bp.blogspot.com/-fcqYJ8sOUtw/X0zEQsZWkVI/AAAAAAAAI24/hAq1jqHHAhYIZoRqkSsdlh3QBBfYcYAwgCLcBGAsYHQ/s1600/fiksioner-no-image.png";
  String tipe;
  String penghuni;
  String harga;
  String nama;
  String id;

  factory GetListProperti.getData(Map<String, dynamic> object) {
    return GetListProperti(
      photo: object['main_image'],
      tipe: object['type'][0],
      //penghuni: object[['category']],
      harga: object['detail_house_price']['yearly'].toString(),
      nama: object['name'],
      id: object['id'],
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
  }) async {
    String url = "https://api.koseeker.id/property?limit=" +
        limit.toString() +
        "&offset=" +
        offset.toString() +
        "&sort=" +
        sort +
        "&area=" +
        area +
        "&kind=" +
        kind +
        "&min_price=" +
        minPrice.toString() +
        "&max_price=" +
        maxPrice.toString() +
        "&room_type=" +
        roomType +
        "&name=" +
        name +
        "&available=" +
        available +
        "&type=" +
        type +
        "&category=" +
        category +
        "&min_dp_price=" +
        minDPPrice.toString() +
        "&max_dp_price=" +
        maxDPPrice.toString() +
        "&lon=" +
        lon +
        "&lat=" +
        lat +
        "&parking_facility=" +
        parkingFacility +
        "&room_facility=" +
        roomFacility +
        "&public_facility=" +
        publicFacility;

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
