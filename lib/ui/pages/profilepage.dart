part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'loading';
  String userID = 'loading';
  String email = 'loading';
  String photo = 'loading';
  Future<String> getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_name');
  }

  Future<String> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_uid');
  }

  Future<String> getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_email');
  }

  Future<String> getPhoto() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_photourl');
  }

  @override
  void initState() {
    super.initState();
    getName().then((value) {
      name = value;
      setState(() {});
    });
    getEmail().then((value) {
      email = value;
      setState(() {});
    });
    getPhoto().then((value) {
      photo = value;
      setState(() {});
    });
    getUserID().then((value) {
      userID = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF14172B),
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Text(name),
          Text(userID),
          Text(email),
          Text(photo),
          RaisedButton(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color(0xffaf8d19),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
