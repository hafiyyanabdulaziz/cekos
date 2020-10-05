part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Haloo'),
            RaisedButton(
              onPressed: CekosGoogleSignIn.signOutGoogle,
              child: Text('logout'),
            )
          ],
        ),
      ),
    );
  }
}
