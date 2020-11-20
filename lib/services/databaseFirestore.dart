part of 'services.dart';

class DatabaseFirestore {
  static CollectionReference likesCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> createOrUpdateLikes({
    @required String userID,
    String propertyID,
    String propertyName,
    String propertyPhotoURL,
  }) async {
    await likesCollection.doc(userID).collection('likes').add({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL
    });
  }

  static Future<void> createOrUpdateSurvey({
    @required String userID,
    String propertyID,
    String propertyName,
    String propertyPhotoURL,
  }) async {
    await likesCollection.doc(userID).collection('survey').add({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL
    });
  }

  static Future<void> createOrUpdateBooking({
    @required String userID,
    String propertyID,
    String propertyName,
    String propertyPhotoURL,
  }) async {
    await likesCollection.doc(userID).collection('booking').add({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL
    });
  }
}
