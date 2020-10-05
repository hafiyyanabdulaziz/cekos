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

    return user;
  }

  static signOutGoogle() async {
    await _googleSignIn.signOut();
  }
}
