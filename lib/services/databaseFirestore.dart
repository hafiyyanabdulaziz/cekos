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
    await likesCollection.doc(userID).collection('likes').doc(propertyID).set({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL
    });
  }

  static Future<void> deleteLikes({
    @required String userID,
    @required String propertyID,
  }) async {
    await likesCollection
        .doc(userID)
        .collection('likes')
        .doc(propertyID)
        .delete();
  }

  static Future<void> createOrUpdateSurvey({
    @required String userID,
    @required String propertyID,
    @required String propertyName,
    @required String propertyPhotoURL,
    @required DateTime tanggal,
  }) async {
    await likesCollection.doc(userID).collection('likes').doc(propertyID).set({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL
    });

    await likesCollection.doc(userID).collection('survey').doc(propertyID).set({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL,
      'tanggal': tanggal,
    });
  }

  static Future<void> createOrUpdateBooking({
    @required String userID,
    @required String propertyID,
    @required String propertyName,
    @required String propertyPhotoURL,
    @required String durasi,
    @required DateTime tanggal,
    @required int harga,
    @required String tipeKamar,
  }) async {
    await likesCollection
        .doc(userID)
        .collection('booking')
        .doc(propertyID)
        .set({
      'propertyID': propertyID,
      'propertyName': propertyName,
      'propertyPhotoURL': propertyPhotoURL,
      'durasi': durasi,
      'tanggal': tanggal,
      'harga': harga,
      'tipeKamar': tipeKamar,
      'status': 'Menuggu Pembayaran'
    });
  }

  static Future getLikes(String userID) async {
    // var firestore = FirebaseFirestore.instance;
    // QuerySnapshot querySnapshot = await firestore
    //     .collection('users')
    //     .doc(userID)
    //     .collection('likes')
    //     .get();
    // return querySnapshot;
    return await likesCollection
        .doc(userID)
        .collection('likes')
        .doc('pU8435tJ7zE1uhmZjrXH')
        .get();
  }
}
