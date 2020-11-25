part of 'services.dart';

class PostRekomendasi {
  String userID;
  String propertyID;

  PostRekomendasi({
    @required this.userID,
    @required this.propertyID,
  });

  factory PostRekomendasi.createPostResult(Map<String, dynamic> object) {
    return PostRekomendasi(
      userID: object['user_id'],
      propertyID: object['property_id'],
    );
  }

  static Future<PostRekomendasi> connectToAPI(
      String userID, String propertyID) async {
    String apiURL = 'https://hafiyyanabdulaziz.pythonanywhere.com/post/';

    var apiResult = await http.post(apiURL,
        body:
            '{"user_id": syfanur, "property_id": "berhasil5", "ratings": 200}');

    var jsonObject = json.decode(apiResult.body);
    return PostRekomendasi.createPostResult(jsonObject);
  }
}
