part of 'services.dart';

class DatabaseFirestore {
  static CollectionReference likesCollection =
      FirebaseFirestore.instance.collection('likes');

  static Future<void> createOrUpdateLikes({
    @required String userID,
    String propertyID,
    String propertyName,
    String propertyPhotoURL,
  }) async {
    await likesCollection.doc(userID).set({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL,
    });
  }
}
