part of 'services.dart';

class CekosGoogleSignIn {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static signInWithGoogle() async {
    await Firebase.initializeApp();
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential authResult = await _auth.signInWithCredential(credential);
    User user = authResult.user;

    print('Nama: ' + user.displayName);
    print('email: ' + user.email);
    print('fotourl: ' + user.photoURL);
    print('uid: ' + user.uid);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user_name', user.displayName);
    sharedPreferences.setString('user_email', user.email);
    sharedPreferences.setString('user_photourl', user.photoURL);
    sharedPreferences.setString('user_uid', user.uid);

    return user;
  }

  static getCurrentUser() async {
    return _auth.currentUser;
  }

  static signOutGoogle() async {
    await _googleSignIn.signOut();
  }
}
