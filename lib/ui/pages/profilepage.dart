part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14172B),
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        title: Text('Profile'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            CekosGoogleSignIn.signOutGoogle();
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            sharedPreferences.clear();

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return SignInPage();
                },
              ),
            );
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Color(0xffaf8d19),
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
